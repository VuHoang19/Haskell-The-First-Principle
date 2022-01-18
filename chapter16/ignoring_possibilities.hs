incMaybe :: Num a => Maybe a -> Maybe a 
incMaybe m = fmap (+1) m 

showMaybe :: Show a 
          => Maybe a 
          -> Maybe String 
showMaybe s = fmap show s 

liftedInc :: (Functor f, Num b)
          => f b -> f b 
liftedInc = fmap (+1)

data Possibly a = 
      LolNope
    | Yeppers s 
    deriving (Eq, Show)

instance Functor Possibly where 
    fmap _ LolNope = LolNope
    fmap f (Yeppers s) = Yeppers (f s)

applyIfJust :: (a -> b)
            -> Maybe a 
            -> Maybe b 

data Sum a b = 
      First a 
    | Second b 
    deriving (Eq, Show)

instance Functor (Sum a) where 
    fmap _ First a = First a 
    fmap f (Second b) = Second (f b)

-- Because the "a" in First is part of "Sum a"'s structure,
-- and you cannot define an instance on "Sum" 
-- as it has the wrong kind (* -> * -> *, as opposed to * -> *)

