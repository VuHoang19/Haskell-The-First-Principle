data Optional a = 
      Nada
    | Only a 
    deriving (Eq, Show)

instance Arbitrary Optional a where 
    arbitrary = frequency [ (1, return Nada)
                          , (2, return (Only a) )]

instance Monoid a
        => Monoid (Optional a) where
    mempty = Nada
    mappend (Only a) (Only b) = Only $ mappend a b
    mappend (Only a) Nada = Only a
    mappend Nada (Only a) = Only a
    mappend Nada Nada = Nada

newtype First' a = 
    First' { getFirst' :: Optional a }
    deriving (Eq, Show)

instance Monoid (First' a) where 
    mempty = First' Nada 
    mappend (First' (Only a)) _ = First' (Only a)
    mappend Nada (First' (Only a)) = First' (Only a)
    mappend (First' Nada) (First' Nada) = First' Nada

firstMappend :: First' a 
            -> First' a 
            -> First' a

firstMappend = mappend

type FirstMappend = 
     First' String 
  -> First' String
  -> First' String 
  -> Bool 

type FstId = 
    First' String -> Bool 

main :: IO ()
main = do 
    quickCheck (monoidAssoc :: FirstMappend)
    quickCheck (monoidLeftIdentity :: FstId)
    quickCheck (monoidRightIdentity :: FstId)
