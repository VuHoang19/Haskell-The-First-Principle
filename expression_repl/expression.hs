import Data.Char

type Value = Double
data Expr
  = Leaf Value
  | Add Expr Expr
  | Sub Expr Expr
  | Div Expr Expr
  | Mul Expr Expr
  deriving (Show)

type EvalErr = String

eval :: Expr -> Either EvalErr Value
eval (Leaf v) = Right v
eval (Add l r) =
  case (eval l, eval r) of
    (Right lv, Right rv) -> Right (lv + rv)
    (Left le, Left re) -> Left (le ++ " " ++ re)
    (Left le, _) -> Left le
    (_, Left re) -> Left re
eval (Sub l r) =
  case (eval l, eval r) of
    (Right lv, Right rv) -> Right (lv - rv)
    (Left le, Left re) -> Left (le ++ " " ++ re)
    (Left le, _) -> Left le
    (_, Left re) -> Left re
eval (Mul l r) =
  case (eval l, eval r) of
    (Right lv, Right rv) -> Right (lv * rv)
    (Left le, Left re) -> Left (le ++ " " ++ re)
    (Left le, _) -> Left le
    (_, Left re) -> Left re
eval (Div l r) =
  case (eval l, eval r) of
    (Right _, Right 0) -> Left "Division by zero"
    (Right lv, Right rv) -> Right (lv / rv)
    (Left le, Left re) -> Left (le ++ " " ++ re)
    (Left le, _) -> Left le
    (_, Left re) -> Left re

-- tokenize
data Token
  = Plus
  | Minus
  | Times
  | Division
  | Open
  | Close
  | Val Value
  deriving (Show)

-- notIsDigit = not . isDigit

lexer :: String -> [Token]
lexer [] = []
lexer ('+' : restStr) = Plus : lexer restStr
lexer ('-' : restStr) = Minus : lexer restStr
lexer ('*' : restStr) = Times : lexer restStr
lexer ('/' : restStr) = Division : lexer restStr
lexer ('(' : restStr) = Open : lexer restStr
lexer (')' : restStr) = Close : lexer restStr
lexer (c : restStr)
  | isSpace c = lexer restStr
lexer str@(c : _)
  | isDigit c = Val (fromIntegral (stringToInt digitStr) :: Value) : lexer restStr
  where
    (digitStr, restStr) = span isDigit str
    stringToInt :: String -> Int
    stringToInt = foldl (\acc c -> 10 * acc + digitToInt c) 0
lexer (c : restString) = error ("unexpected character " ++ show c ++ " in expression!")

parseValue :: [Token] -> Maybe (Expr, [Token])
parseValue (Val v : restTokens) = Just (Leaf v, restTokens)
parseValue _ = Nothing

parseProductOrValue :: [Token] -> Maybe (Expr, [Token])
parseProductOrValue tokens = case parseValue tokens of
  Just (expr1, Times : restTokens1) ->
    case parseProductOrValue restTokens1 of
      Just (expr2, restTokens2) -> Just (Mul expr1 expr2, restTokens2)
      Nothing -> Nothing
  result -> result --nothing or err

parseSum :: [Token] -> Maybe (Expr, [Token])
parseSum tokens = case parseValue tokens of
  Just (expr1, Plus : restTokens1) ->
    case parseSum restTokens1 of
      Just (expr2, restTokens2) -> Just (Add expr1 expr2, restTokens2)
      Nothing -> Nothing
  result -> result --nothing or err

parseSub :: [Token] -> Maybe (Expr, [Token])
parseSub tokens = case parseValue tokens of
  Just (expr1, Minus : restTokens1) ->
    case parseSub restTokens1 of
      Just (expr2, restTokens2) -> Just (Sub expr1 expr2, restTokens2)
      Nothing -> Nothing
  result -> result --nothing or err

parseDiv :: [Token] -> Maybe (Expr, [Token])
parseDiv tokens = case parseValue tokens of
  Just (expr1, Division : restTokens1) ->
    case parseDiv restTokens1 of
      Just (expr2, restTokens2) -> Just (Div expr1 expr2, restTokens2)
      Nothing -> Nothing
  result -> result --nothing or err

parseIntExpr :: [Token] -> Maybe (Expr, [Token])
parseIntExpr (Val v : restTokens) =
  Just (Leaf v, restTokens)
parseIntExpr (Open : restTokens1) =
  case parseSubExpr restTokens1 of
    Just (expr, Close : restTokens2) -> Just (expr, restTokens2)
    Just _ -> Nothing
    Nothing -> Nothing
parseIntExpr tokens = Nothing

parseProdExpr :: [Token] -> Maybe (Expr, [Token])
parseProdExpr tokens =
  case parseIntExpr tokens of
    Just (expr1, Times : restTokens1) ->
      case parseProdExpr restTokens1 of
        Just (expr2, restTokens2) -> Just (Mul expr1 expr2, restTokens2)
        Nothing -> Nothing
    result -> result

parseDivExpr :: [Token] -> Maybe (Expr, [Token])
parseDivExpr tokens =
  case parseProdExpr tokens of
    Just (expr1, Division : restTokens1) ->
      case parseDivExpr restTokens1 of
        Just (expr2, restTokens2) -> Just (Div expr1 expr2, restTokens2)
        Nothing -> Nothing
    result -> result
    
parseSumExpr :: [Token] -> Maybe (Expr, [Token])
parseSumExpr tokens =
  case parseDivExpr tokens of
    Just (expr1, Plus : restTokens1) ->
      case parseSumExpr restTokens1 of
        Just (expr2, restTokens2) -> Just (Add expr1 expr2, restTokens2)
        Nothing -> Nothing
    result -> result

parseSubExpr :: [Token] -> Maybe (Expr, [Token])
parseSubExpr tokens =
  case parseSumExpr tokens of
    Just (expr1, Minus : restTokens1) ->
      case parseSubExpr restTokens1 of
        Just (expr2, restTokens2) -> Just (Sub expr1 expr2, restTokens2)
        Nothing -> Nothing
    result -> result



parse :: [Token] -> Expr
parse tokens =
  case parseSubExpr tokens of
    Just (expr, []) -> expr
    _ -> error "Could not parse input"

main = do 
  exprInput <- getLine 
  putStrLn $ either show show  (eval . parse . lexer $ exprInput)
