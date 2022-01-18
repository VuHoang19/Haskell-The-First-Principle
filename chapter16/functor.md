## Functor
- understanding Functor and Applicative is important to a deep understanding of Monad 
- a functor is a way to apply a function over or around some structure that we don't want to alter 
- functor is implemented in Haskell with a typeclass, just like Monoid.

## Functor Laws
### Identity
- fmap id == id 
- composition
    fmap (f . g) == fmap f . fmap g