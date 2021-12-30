cattyConny :: String -> String -> String 
cattyConny x y = x ++ " mrow " ++ y

flippy = flip cattyConny

appedCatty = cattyConny "woops"
frappe = flippy "haha"

sum x = f x 0
    where f n count
        | n == 0 = count 
        | otherwise = f (n - 1) b (count + b)

mult a b = go a b 0
    where go a b count
        | a == 0 = count 
        | otherwise = go (a - 1) b (count + b)

mc91 n
    | n > 100 = n - 10
    | otherwise = mc91 (m91 (n + 11))