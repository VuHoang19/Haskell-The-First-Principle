import Test.QuickCheck

newtype Identity a = 
    Identity a 
    deriving (Eq, Show)

instance Functor Identity where 
    fmap f (Identity a) = Identity $ f a 

instance Arbitrary a => Arbitrary (Identity a) where 
    arbitrary = Identity <$> arbitrary 

data Pair a = 
    Pair a 
         a
    deriving (Eq, Show)

instance Functor Pair where 
    fmap f (Pair l r) = Pair (f l) (f r)

instance Arbitrary a => Arbitrary (Pair a) where 
    arbitrary = do 
        l <- arbitrary
        r <- arbitrary
        return $ Pair l r 

data Two a b = Two a b 

instance Functor (Two a) where 
    fmap f (Two a b) = Two a (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where 
    arbitrary = do 
        a <- arbitrary
        b <- arbitrary
        return $ Two a b

data Three a b c = Three a b c 

instance Functor (Three a b) where 
    fmap f (Three a b c) = Three a b (f c)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where 
    arbitrary = do 
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        return $ Three a b c 

data Three' a b = Three' a b b 

instance Functor (Three' a) where 
    fmap f (Three' a l r) = Three' a (f l) (f r)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where 
    arbitrary = do
        a <- arbitrary
        l <- arbitrary
        r <- arbitrary
        return $ Three' a l r 

data Four a b c d = Four a b c d 

instance Four a b c d = Four a b c d 

instance Functor (Four a b c) where 
    fmap f (Four a b c d) = Four a b c (f d)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where 
    arbitrary = do 
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four a b c d 

data Four' a b = Four' a a a b 

instance Functor (Four' a) where 
    fmap f (Four' l m r b) = Four l m r (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four') where 
    arbitrary = do 
        l <- arbitrary
        m <- arbitrary
        r <- arbitrary
        b <- arbitrary
        return $ Four' l m r b

data Trivial = Trivial

-- *Main> :k Trivial
--Trivial :: *
-- so not implemt functor for this type Trivial
