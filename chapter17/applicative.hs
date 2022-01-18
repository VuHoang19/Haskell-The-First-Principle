import Control.Applicative
import Data.List (elemIndex)

f x = 
    lookup x [ (3, "hello")
             , (4, "julie")
             , (5, "kbai")]

g y = 
    lookup y [ (7, "sup?")
             , (8, "chris")
             , (9, "aloha")]

h z = 
    lookup z [(2, 3), (5, 6), (7, 8)]

m x =
    lookup x [(4, 10), (8, 13), (1, 9001)]
 
-- liftA :: Applicative f =>
--       (a -> b) 
--     -> f a 
--     -> f b 

-- liftA2 :: Applicative f => 
--       (a -> b -> c) 
--     -> f a 
--     -> f b 
--     -> f c

-- liftA3 :: Applicative f => 
--       (a -> b -> c -> d)
--     -> f a 
--     -> f b 
--     -> f c 
--     -> f d

-- added :: Maybe Integer 
-- added = 
--     pure (+3) <*> (lookup 3 $ zip [1, 2, 3] [4, 5, 6])

-- y :: Maybe Integer 
-- y = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

-- z :: Maybe Integer 
-- z = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

-- tupled :: Maybe (Integer, Integer)
-- tupled = (,) <$> y <*> z 



-- x :: Maybe Int 
-- x = elemIndex 3 [1, 2, 3, 4, 5]

-- y :: Maybe Int 
-- y = elemIndex 4 [1, 2, 3, 4, 5]

-- max' :: Int -> Int -> Int 
-- max' = max 

-- maxed :: Maybe Int 
-- maxed = max' <$> x <*> y

xs = [1, 2, 3]
ys = [4, 5, 6]

x :: Maybe Integer 
x = lookup 3 $ zip xs ys 

y :: Maybe Integer 
y = lookup 2 $ zip xs ys 

summed :: Maybe Integer 
summed = fmap sum $ (,) <$> x <*> y
-- instance Monoid a => Monoid (Maybe a) where 
--     mempty = Nothing
--     mappend m Nothing = m 
--     mappend Nothing m = m 
--     mappend (Just a) (Just a') = 
--         Just (mappend a a')
    
-- instance Applicative Maybe where 
--     pure = Just 

--     Nothing <*> _ = Nothing 
--     _ <*> Nothing = Nothing 
--     Just f <*> Just a = Just (f a)

newtype Identity a = Identity a 
    deriving (Eq, Ord, Show)

instance Functor Identity where 
    fmap f (Identity a) = Identity (f a)

instance Applicative Identity where 
    pure = Identity
    (Identity f) <*> (Identity a) = Identity (f a)

newtype Constant a b = 
    Constant { getConstant :: a}
    deriving (Eq, Ord, Show)

instance Functor (Constant a) where 
    fmap _ (Constant a) = Constant a 

instance Monoid a 
      => Applicative (Constant a) where 
    pure _ = Constant mempty
    (Constant l) <*> (Constant r) = Constant (l <> r)

validateLength :: Int 
               -> String 
               -> Maybe String 
validateLength maxLen s = 
    if (length s) > maxLen
    then Nothing 
    else Just s 

newtype Name = 
    Name String deriving (Eq, Show) 

newtype Address = 
    Address String deriving (Eq, Show) 

mkName :: String -> Maybe Name 
mkname s = 
    fmap Name $ validateLength 25 s 

mkAddress :: String -> Maybe Address 
mkAddress a = 
    fmap Address $ validateLength 100 a 

data Person = 
    Person Name Address 
    deriving (Eq, Show)

mkPerson :: String 
         -> String 
         -> Maybe Person
mkPerson n a = 
    case mkName n of 
        Nothing -> Nothing 
        Just n' -> 
            case mkAddress a of
                Nothing -> Nothing 
                Just a' -> 
                    Just $ Person n' a' 




