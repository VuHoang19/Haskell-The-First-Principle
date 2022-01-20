import Control.Monad
import Control.Applicative
import Data.Char
import Data.Maybe
import Data.List
import System.IO

import Data.Scientific
import Text.ParserCombinators.ReadP

-- Backus Normal Form
--
-- <integer>            ::= <digit> | <integer><digit>
-- <op>                                 ::= + | - | * | / | ^
-- <var>                                ::= <character> | <var><character>
-- <expr>                               ::= <expr> <op> <expr>
--                                                      |               (<expr> <op> <expr>)
--                                                      |               <var>
--                                                      |               <integer>

type Value = Scientific
type VName = String
data Assignments = Map VName Value
data Expr
  = ENumber Value
  | EVar VName
  | ENeg Expr
  | EAdd Expr Expr
  | ESub Expr Expr
  | EDiv Expr Expr
  | EMul Expr Expr
  | EPow Expr Expr
  deriving (Show)

number = skipSpaces *> (ENumber . read <$> munch1 isDigit)
var = skipSpaces *> (EVar <$> munch1 isAlpha)
addop = skipSpaces *> (EAdd <$ char '+' <|> ESub <$ char '-')
mulop = skipSpaces *> (EMul <$ char '*' <|> EDiv <$ char '/')
expop = skipSpaces *> (EPow <$ char '^')
neg p = skipSpaces *> (ENeg <$> (char '-' *> p))
assignpop = skipSpaces *> (Map <$ char '=')

parens = between (skipSpaces *> char '(') (skipSpaces *> char ')')

mathExp = mathExp' <* skipSpaces <* eof
mathExp' = term `chainl1` addop
term = factor `chainl1` mulop
factor = expo `chainr1` expop
expo = number <|> var <|> parens mathExp' <|> neg expo

-- assignExp = var

runParser :: ReadP a -> String -> Maybe a
runParser p s =
  case readP_to_S p s of
    [(x, [])] -> Just x
    _ -> Nothing

-- example x = 1, y = 2, z = 3
variables = [("x", 1), ("y", 2), ("z", 3)]

eval :: Expr -> Maybe Value
eval expr =
  case expr of
    ENumber val -> Just val
    EAdd l r -> (+) <$> eval l <*> eval r
    ESub l r -> (-) <$> eval l <*> eval r
    EMul l r -> (*) <$> eval l <*> eval r
    EPow l r ->
      if fromJust $ isInteger <$> eval r
        then (^) <$> eval l <*> (round <$> eval r)
        else Nothing
    EDiv l r ->
      case eval r of
        Just 0 -> Nothing
        _ -> (/) <$> eval l <*> eval r
    ENeg ex -> (-) <$> Just 0 <*> eval ex
    EVar var -> lookup var variables
    -- _ -> Nothing

calculate :: String -> Maybe Value
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
    print_ (maybe "Error, can't parse this expression!" show (calculate input)) >> main