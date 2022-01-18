fibs' = take 20 fibs

fibs'' = takeWhile (<100) fibs

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

facts :: [Integer]
facts = scanl (*) 1 [1..]

factorial' :: Integer -> Integer
factorial' n = facts !! (fromInteger n)