newtype Age = 
    Age Integer
    deriving (Eq, Show)

newtype Year =
    Year Integer 
    deriving (Eq, Show)

class Numberish a where
    fromNumber      :: Integer -> a
    toNumber        :: a -> Integer
    defaultNumber   :: a

instance Numberish Age where
    fromNumber n = Age n 
    toNumber (Age n) = n 
    defaultNumber = Age 65

instance Numberish Year where
    fromNumber n = Year n 
    toNumber (Year n) = n 
    defaultNumber = Year 1988 

data Person = Person Bool
    deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

data Mood = Blah
          | Woot deriving (Show, Eq)

settleDown x = if x == Woot 
                 then Blah
                 else x


type Subject = String
type Verb = String
type Object = String

data Sentence = 
    Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

data Rocks = 
    Rocks String deriving (Eq, Show)

data Yeah = 
    Yeah Bool deriving (Eq, Show)

data Papu = 
    Papu Rocks Yeah
    deriving (Eq, Show)

equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'
