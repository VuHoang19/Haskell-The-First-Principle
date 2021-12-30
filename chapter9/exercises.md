1. [1,2,3,4,5] : Nf + WHNF
2. 1 : 2: 3 : 4 : _: WHNF
3. enumFromTo 1 10 : neither
4. length [1,2,3,4,5]: neither
5. sum (enumFromTo 1 10): neither
6. ['a'..'m'] ++ ['n'..'z']
7. (_, 'b'): WHNF

## Chapter Exercises
1. 
isUpper :: Char -> Bool
toUpper :: Char -> Char
2.
upperOnly :: String -> String
upperOnly = filter isUpper
3.
capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = toUpper x : xs
4.
capitalizeAll :: String -> String
capitalizeAll [] = []
capitalizeAll (x:xs) = toUpper x : capitalizeAll xs
5. 
capitalizeHead :: String -> Char
capitalizeHead xs = toUpper . head $ xs

6. 
capitalizeHead :: String -> Char
capitalizeHead = toUpper . head