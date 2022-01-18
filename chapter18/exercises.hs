data Nope a = 
	NopeDotJpg

instance Functor Nope where 
	fmap _ NopeDotJpg = NopeDotJpg

instance Applicative Nope where 
	pure _ = Nope mempty
	_ <*> _ = NopeDotJpg

instance Monad Nope where 
	return = pure 
	_ >>= _ = NopeDotJpg


data PhhhbbtttEither b a =
		Left a 
	| Right b 

instance Functor (PhhhbbtttEither b) where 
	fmap _ (Right b) = Right b 
	fmap f (Left a) = fmap Left $ f a 

instance Applicative (PhhhbbtttEither b) where 
	pure = Left 
	_ <*> (Right b) = Right b
	(Left f) <*> (Left a) = Left $ f a  

instance Monad (PhhhbbtttEither b) where 
	return = pure 
	(Right b) >>= _ = Right b 
	(Left a) >>= f = f a 

newtype Identity a = Identity a 
		deriving (Eq, Ord, Show)

instance Functor Identity where 
	fmap f (Identity a) = Identity (f a) 

instance Applicative Identity where 
	pure = Identity
	(Identity f) <*> (Identity a) = Identity $ f a 

instance Monad Identity where 
	return = pure 
	(Identity a) >>= f = f a 

data List a = 
		Nil 
	| Cons a (List a)

instance Functor List where 
	fmap _ Nil = Nil 
	fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where 
	pure = Cons
	_ <*> Nil = Nil 
	(Cons x : xs) <*> (Cons ys) = Cons x ((Cons xs) <*> (Cons ys)) 

instance Monad List where
	return = pure 
	Nil >>= _ = Nil
	(Cons x xs) >>= f = Cons (f x) ((Cons xs) >>= f) 

-- id a = a
j :: Monad m => m (m a) -> m a
j mma = mma >>= id 

l1 :: Monad m => (a -> b) -> m a -> m b 
l1 f ma = ma >>= return . f

l2  :: Monad m 
		=> (a -> b -> c) -> m a -> m b -> m c
l2 f ma mb = ma >>= \a -> mb >>= \b -> return $ f a b

a :: Monad m => m a -> m (a -> b) -> m b 
a ma mf = ma >>= \a -> mf >>= \f -> return $ f a

meh :: Monad m 
		=> [a] -> (a -> m b) -> m [b]

meh (a:as) f = f a >>= \b -> (meh as f) >>= bs -> return $ b:bs
	
flipType :: (Monad m) => [m a] -> m [a]
flipType ms = meh ms id