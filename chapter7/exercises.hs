functionC x y = 
    case x > y of
        True    -> x
        False   -> y

ifEvenAdd2 n = 
    case even n of
        True    -> n + 2
        False   -> n 

num x = 
    case compare x 0 of 
        LT  -> -1
        GT  -> 1
        Eq  -> 0

-- Let's write code
-- 1.
tensDigit :: Integral a => a -> a 
tensDigit x = d 
    where xLast = x `div` 10
          d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a 
tensDigit' x = d
    where (xLast, _) = x `divMod` 10
          (_, d)     = xLast `divMod` 10
        
hunsD x = d2
    where (xLast, _) = x `divMod` 100
          (_, d2)    = xLast `divMod` 10

-- 2.
foldBool :: a -> a -> Bool -> a 
foldBool x y b = case b of
                    True  -> x 
                    False -> y
foldBool' :: a -> a -> Bool -> a 
foldBool' x y b 
    | b         = x 
    | otherwise = y

-- 3. 
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)

-- 4.

-- 5. Point Free
roundTrip :: (Show a, Read a) => a -> a 
roundTrip = read . show


-- 6. 
print((roundTrip 4) :: Int)