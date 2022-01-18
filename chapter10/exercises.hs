stops = "pbtdkg"
vowels = "aeiou"

svs = [[s1, v, s2] | s1 <- stops, v <- vowels, s2 <- stops]

svs' = [[s1, v, s2] | s1 <- stops, v <- vowels, s2 <- stops, s1 == 'p']

myOr :: (a -> Bool) -> [a] -> Bool 
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool 
myAny f = foldr (||) False . map f 

myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr (\a b -> b || a == e) False 

myElem' :: Eq a => a -> [a] -> Bool 
myElem' e = any (== e)

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [a] 
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a] 
myFilter f = foldr (\a b -> if f a then (a:b) else b) [] 

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: [[a]] -> [a]
squishMap f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id 

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f = head . foldr (\a b -> 
                                case b of 
                                    [] -> [a]
                                    (b:bs) -> if f a b == GT then [a] else [b]
                             )[]

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f as = case as of 
                    [] -> undefined
                    (a:as) -> foldr (\a b -> if f a b == LT then a else b) a as 