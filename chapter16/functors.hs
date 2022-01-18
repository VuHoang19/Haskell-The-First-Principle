data FixMePls a = 
      FixMe
    | Pls a 
    deriving (Eq, Show)

instance Functor FixMePls where 
    fmap _ FixMe = FixMe 
    fmap f (Pls a) = Pls (f a) 

data BinaryTree a = 
      Leaf 
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Show)

instance Functor BinaryTree where 
    fmap _ Leaf = Leaf
    fmap f (Node l a r) = Node (fmap f l) (f a) (fmap f r)

data WhoCares a =
      ItDoesnt
    | Matter a 
    | WhatThisIsCalled
    deriving (Eq, Show)

instance Functor WhoCares where
    fmap _ ItDoesnt = ItDoesnt
    fmap _ WhatThisIsCalled = WhatThisIsCalled
    fmap f (Matter a) = Matter (f a)

data CountingBad a = 
    Heisenberg Int a 
    deriving (Eq, Show)

instance Functor CountingBad where 
    fmap f (Heisenberg n a) = 
        Heisenberg (n+1) (f a)

data CountingGood a = 
    Heisenberg' Int a 
    deriving (Eq, Show)

instance Functor CountingGood where 
    fmap f (Heisenberg' n a) = 
        Heisenberg' (n) (f a)


