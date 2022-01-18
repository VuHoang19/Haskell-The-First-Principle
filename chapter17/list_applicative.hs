data List a = 
      Nil 
    | Cons a (List a) 
    deriving (Eq, Show)

append :: List a -> List a -> List a 
append Nil ys = ys 
append (Cons x xs) ys = 
    Cons x $ xs `append` ys 

fold :: (a -> b -> b) -> b -> List a -> b 
fold _ b Nil = b 
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a 
concat' = fold append Nil 

flatMap :: (a -> List b)
        -> List a 
        -> List b 

flatMap _ Nil = Nil 
flatMap f (x Cons xs) = Cons (f x) (flatMap f xs)

take' :: Int
      -> List a 
      -> List a 
take' _ Nil = Nil 
take' n (Cons x xs)
    | n <= 0    = Nil 
    | otherwise = Cons x (take' (n-1) xs)

instance Functor List where 
    fmap _ Nil = Nil 
    fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where 
    pure a = Cons a Nil 
    Nil <*> _ = Nil 
    _ <*> Nil = Nil 
    (Cons f fs) <*> as = fmap f as `append` (fs <*> as)
    