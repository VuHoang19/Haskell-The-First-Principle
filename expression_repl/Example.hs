import Data.Char
import Control.Monad
import Control.Applicative
import Text.ParserCombinators.ReadP

type Name = String
type Number = Int

data MathExp
  = Number Number
  | Neg MathExp
  | Plus MathExp MathExp
  | Minus MathExp MathExp
  | Mult MathExp MathExp
  | Div MathExp MathExp
  | Pow MathExp MathExp
  | Var Name
  deriving (Eq, Show)

runParser :: ReadP a -> String -> Maybe a
runParser p s =
  case readP_to_S p s of
    [(x, [])] -> Just x
    _ -> Nothing

mathExp = mathExp' <* skipSpaces <* eof
mathExp' = term `chainl1` addop
term = factor `chainl1` mulop
factor = expo `chainr1` expop
expo = number <|> var <|> parens mathExp' <|> neg expo

number = skipSpaces *> (Number . read <$> munch1 isDigit)
var = skipSpaces *> (Var <$> munch1 isAlpha)
addop = skipSpaces *> (Plus <$ char '+' <|> Minus <$ char '-')
mulop = skipSpaces *> (Mult <$ char '*' <|> Div <$ char '/')
expop = skipSpaces *> (Pow <$ char '^')
neg p = skipSpaces *> (Neg <$> (char '-' *> p))

parens = between (skipSpaces *> char '(') (skipSpaces *> char ')')

main = print $ runParser mathExp "1+2* - "