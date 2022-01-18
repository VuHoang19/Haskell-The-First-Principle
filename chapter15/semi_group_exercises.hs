import Data.Monoid
import Data.Semigroup
import Test.QuickCheck
import Control.Monad 


data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where 
    _ <> _ = Trivial

instance Monoid Trivial where
    mempty = Trivial
    mappend = (<>)

instance Arbitrary Trivial where 
    arbitrary = return Trivial

semigroupAssoc  :: (Eq m, Semigroup m)
                => m -> m -> m -> Bool 
semigroupAssoc a b c = 
    (a <> (b <> c)) == ((a <> b) <> c)

type TrivAssoc = 
    Trivial -> Trivial -> Trivial -> Bool 

main :: IO ()
main = 
    quickCheck (semigroupAssoc :: TrivAssoc) 

newtype Identity a = Identity a 

instance Semigroup a => Semigroup (Identity a) where 
    (Identity a) <> (Identity b) = Identity (a <> b)

instance Monoid a => Monoid (Identity a) where 
    mempty = Identity mempty
    mappend = (<>)

data Two a b = Two a b 

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where 
    (Two a b) <> (Two a' b') = Two (a <> a') (b <> b')

instance (Monoid a, Monoid b) => Monoid (Two a b) where 
    mempty = Two mempty mempty 
    mappend = (<>)

data Three a b c = Three a b c 

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where 
    (Three a b c) <> (Three a' b' c') = Three (a <> a') (b <> b') (c <> c')

instance (Monoid a, Monoid b, Monoid c) => Monoid (Three a b c) where 
    mempty = Three mempty mempty mempty
    mappend = <>

data Four a b c d = Four a b c d 

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d) => Semigroup (Four a b c d) where 
    (Four a b c d) <> (Four a' b' c' d') = Four (a <> a') (b <> b') (c <> c') (d <> d')

instance (Monoid a, Monoid b, Monoid c, Monoid d) => Monoid (Four a b c d) where 
    mempty = Four mempty mempty mempty mempty
    mappend = <> 

newtype BoolConj = 
    BoolConj Bool 

instance Semigroup BoolConj where
    (BoolConj True) <> (BoolConj True) = BoolConj True 
    _ <> _ BoolConj False 

instance Monoid BoolConj where 
    mempty = BoolConj True
    mappend = (<>)

newtype BoolDisj = 
    BoolDisj Bool 

instance Semigroup BoolDisj where 
    (BoolDisj True) <> (BoolDisj True) = BoolDisj True 
    (BoolDisj True) <> (BoolDisj False) = BoolDisj True 
    (BoolDisj False) <> (BoolDisj True) = BoolDisj True 
    _ <> _ = BoolDisj False 

instance Monoid BoolDisj where 
    mempty = BoolDisj False 
    mappend = <> 

data Or a b = 
      Fst a
    | Snd b 

instance Semigroup (Or a b) where 
    (Snd b) <> _ = Snd b 
    _ <> (Snd b) = Snd b 
    _ <> (Fst a) = Fst a

