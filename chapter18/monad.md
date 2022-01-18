what use it?
why use it?
how use it?


I mean that ...

feedback


fmap :: Funtor f
     => (a -> b) -> f a -> f b
<*>  :: Applicative f
     => f (a -> b) -> f a -> f b
>>=  :: Monad f
     => f a -> (a -> f b) -> f b

## What monad is not
- monad is somewhat abstract and a little slippery, many people talk about it from one or two perspectives that they feel most comfortable with
- However understanding monads only through that instances leads to limited intuitions for what monads are and can do, and to lesser extent, a wrong notion of what IO is all about.

(>>=) :: m a -> (a -> m b) -> m b 
(>>) :: m a -> m b -> m b 
return :: a -> m a

(>>=) :: Monad m
     => m a -> (a -> m b) -> m b