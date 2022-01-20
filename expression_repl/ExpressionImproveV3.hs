import Control.Monad
import Control.Applicative
import Data.Char
import Data.List
import System.IO

import Data.Scientific
import Text.ParserCombinators.ReadP
import Data.Either

-- Backus Normal Form
--
-- <integer>            ::= <digit> | <integer><digit>
-- <op>                                 ::= + | - | * | / | ^
-- <var>                                ::= <character> | <var><character>
-- <expr>                               ::= <op> <expr> <expr>
--                                      |   (<op> <expr> <expr>)
--                                      |   - <expr>
--                                      |   <var>
--                                      |   <integer>

type Value = Integer
type VName = String
data ExpError = EvalError String | ParseError String deriving (Show)
data Assignments = Map VName Value
data Op = Add | Sub | Mul | Div | Pow deriving (Show)
data Expr
  = ENumber Value
  | EVar VName
  | ENeg Expr
  | EBin Op Expr Expr
  deriving (Show)

divInt :: Value -> Value -> Value
divInt a b = floor (fromIntegral a / fromIntegral b)

mapOp :: Op -> (Value -> Value -> Value)
mapOp Div = divInt
mapOp Pow = (^)
mapOp Sub = (-)
mapOp Add = (+)
mapOp Mul = (*)

number = skipSpaces *> (ENumber . read <$> munch1 isDigit)
var = skipSpaces *> (EVar <$> munch1 isAlpha)
addop = skipSpaces *> (EBin Add <$ char '+' <|> EBin Sub <$ char '-')
mulop = skipSpaces *> (EBin Mul <$ char '*' <|> EBin Div <$ char '/')
expop = skipSpaces *> (EBin Pow <$ char '^')
neg p = skipSpaces *> (ENeg <$> (char '-' *> p))
assignpop = skipSpaces *> (Map <$ char '=')
parens = between (skipSpaces *> char '(') (skipSpaces *> char ')')

mathExp = mathExp' <* skipSpaces <* eof
mathExp' = term `chainl1` addop
term = factor `chainl1` mulop
factor = expo `chainr1` expop
expo = number <|> var <|> parens mathExp' <|> neg expo

-- assignExp = var
-- example x = 1, y = 2, z = 3
variables = [("x", 1), ("y", 2), ("z", 3)]

runParser :: ReadP a -> String -> Either ExpError a
runParser p s =
  case readP_to_S p s of
    [(x, [])] -> Right x
    _ -> Left $ ParseError "Parse error!"

eval :: Expr -> Either ExpError Value
eval expr =
  case expr of
    ENumber val -> Right val
    EBin op l r -> 
      case op of
        Div -> 
          case eval r of
            Right 0 -> Left $ EvalError "Division by zero!"
            _ -> divInt <$> eval l <*> eval r
        _ -> mapOp op <$> eval l <*> eval r
    ENeg ex -> (-) <$> Right 0 <*> eval ex
    EVar var -> 
      case lookup var variables of 
        Just val -> Right val 
        _ -> Left $ EvalError "Variable not found"
    -- _ -> Nothing

calculate :: String -> Either ExpError Value
calculate = runParser mathExp >=> eval

read_ :: IO String
read_ =
  putStr "REPL> "
    >> hFlush stdout
    >> getLine

print_ :: String -> IO ()
print_ = putStrLn

main :: IO ()
main = do
  input <- read_
  unless (input == ":q") $
    print_ (either show show (calculate input)) >> main