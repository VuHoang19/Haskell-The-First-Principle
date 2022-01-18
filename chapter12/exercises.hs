vigenere :: String -> String -> String
vigenere key plain = map encode $ zipWithSpaces code $ cycle key 
    where 
        encode (c, k) = rotChar (ord k - ord ' ') c

notThe :: String -> Maybe String 
notThe s = 
    if s /= "the"
        then Just s 
        else Nothing

replaceThe :: String -> String 
replaceThe = unwords . go . words 
    where 
        go [] = []
        go (w:ws) = 
            case notThe w of
                Just w -> w : go ws 
                Nothing -> "a" : go ws 

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = go . words 
    where 
        go (wa:wb:wc) = 
            case notThe wa of
                Just _ -> go (wb:ws)
                Nothing -> 
                    if vowelInitial wb 
                        then 1 + go (wb:ws)
                        else go (wb:ws)
        go _ = 0

vowelInitial :: String -> Bool 
vowelInitial [] = False
vowelInitial (x:_) = isVowel x

isVowel :: Char -> Bool 
isVowel c = c `elem` vowels

vowels = "aeiou"

countVowels :: String -> Integer
countVowels = fromIntegral . length . filter (isVowel)

newtype Word' = 
    Word' String deriving (Eq, Show)

countConsonants :: String -> Integer
countConsonants = fromIntegral . length . filter (not . isVowel)

mkWord :: String -> Maybe Word'
mkWord s 
    | countVowels s > countConsonants s = Nothing 
    | otherwise = Just $ Word' s 

data Nat = 
    Zero
    | Succ Nat
    deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: integer -> Maybe Nat 
integerToNat i = 
    if i >= 0
        then Just $ go i 
        else Nothing
    where
        go 0 = Zero
        go i = Succ (go $ i - 1)

isJust :: Maybe a -> Bool 
isJust Nothing = False 
isJust _ = True 

isNothing :: Maybe a -> Bool 
isNothing Nothing = True 
isNothing _ = False 

mayybee :: b -> (a-> b) -> Maybe a -> b 
mayybee b f Nothing = b 
mayybee b f (Just a) = f a 

fromMaybe :: a -> Maybe a -> a 
fromMaybe a = mayybee a id 

listToMaybe :: [a] -> Maybe a 
listToMaybe [] = Nothing 
listToMaybe (a:_) = Just a 

maybeToList :: Maybe a -> [a] 
maybeToList Nothing = []
maybeToList (Just a) = [a]

catMaybes :: [Maybe a] -> [a] 
catMaybes [] = [] 
catMaybes (ma:ms) = 
    case ma of
        Just a -> a : catMaybes ms 
        Nothing -> catMaybes ms 

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe [] = Just []
flipMaybe (ma:ms) = 
        case ma of 
            Just a -> (a :) <$> flipMaybe ms 
            Nothing -> Nothing 

lefts' :: [Either a b] -> [a]
lefts' = foldr f []
    where 
        f e as = 
            case e of 
                Left a -> (a : as)
                Right _ -> as 

rights' :: [Either a b] -> [b]
rights' = foldr f []
    where 
        f e bs = 
            case e of 
                Left _ -> bs 
                Right b -> b : bs 

partionEithers' :: [Either a b] -> ([a], [b])
partionEithers' = foldr f ([], [])
    where 
        f e (as, bs) = 
            case e of 
                Left a -> ((a:as), bs)
                Right b -> (as, (b: bs))

eitherMaybe'
    :: (b -> c)
    -> Either a b 
    -> Maybe c
eitherMaybe' f e =
    case e of 
        Left _ -> Nothing
        Right b -> Just $ f b

either' :: (a -> c) -> (b -> c) -> Either a b -> Maybe c 
either' f g e = 
    case e of 
        Left a -> f a 
        Right b -> g b 

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c 
eitherMaybe'' f = either' (const Nothing) (Just . f)

myIterate :: (a -> a) -> a -> [a]
myIterate f a = a : iterate f (f a)

myUnfoldr
    :: (b -> Maybe (a, b))
    -> b 
    -> [a]

myUnfoldr f b = 
    case f b of 
        Just (a, b) -> a : myUnfoldr f b 
        Nothing -> []

betterIterate :: (a -> a) -> a -> [a]
betterIterate f a = myUnfoldr next a 
    where 
        next a = Just (a, f a)

data BinaryTree a 
    = Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

unfold 
    :: (a -> Maybe (a,b,a))
    -> a 
    -> BinaryTree b 

unfold f a = 
    case f a of 
        Just (la, b, ra) -> Node (unfold f la) b (unfold f ra)
        Nothing -> Leaf 

treeBuild
    :: Integer
    -> BinaryTree Integer

treeBuild n = unfold (f n) 0
    where 
        f :: Integer -> Integer -> Maybe (Integer, Integer, Integer)
        f n i 
            | n > i = Just (i+1, i, i + 1)
            | otherwise = Nothing 
            
