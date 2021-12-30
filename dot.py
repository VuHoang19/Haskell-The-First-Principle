def dot(f, g, x): 
    return f(g(x))


## f . g
## f :: a -> b
## g :: c -> a
## f . g :: (a -> b) -> (c -> a) -> (c -> b)
def dot2(f, g):
    def fn(args):
        return f(g(args))
    return fn

