fmap :: Functor
     => (a -> f b) -> f a -> f (f b)

join :: Monad m => m (m a) -> m a 

bind :: Monad m => (a -> m b) -> m a -> m b 
bind = join . fmap f 