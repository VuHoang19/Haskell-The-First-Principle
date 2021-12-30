enumFrom' :: Num a => a -> [a]
enumFrom' n = [n] ++ enumFrom' (n+1)

zip :: [a] -> [b] -> [(a,b)]
zip [] _ = []
zip _ [] = []
zip (a:as) (b:bs) = (a, b) :: zip as bs