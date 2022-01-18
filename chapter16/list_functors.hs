-- data [] a = [] | a : [a]

-- instance Functor MyList where 
--     fmap f [] = []
--     fmap f (x:xs) = (f x) : fmap f xs
data (,) a b = (,) a b

instance Functor ((,) a) where 
    fmap f (a, b) = (a, f b)