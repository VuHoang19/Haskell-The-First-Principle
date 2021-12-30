
dot :: (b -> c) -> (a -> b) -> (a -> c)


-- \f. \g. \x. f g x

dot = \f -> (\g -> \x -> f (g x))


-- dot f = \g -> \x -> f (g x)
-- dot f g = \x -> f (g x)
-- dot f g x = f (g x)

-- add :: Int -> Int -> Int
-- add x y = x + y

-- a -> b -> c 
-- a -> (b -> c

-- a -> b -> c -> d
-- a -> (b -> c -> d)

-- a -> (b -> (c -> d))
-- a -> b -> (c -> d)

-- -- Type cua
-- dot dot dot

-- dot :: (b -> c) -> (a -> b) -> (a -> c)

dot dot dot
    f   g

f:: (b1 -> c1) -> (a1 -> b1) -> (a1 -> c1)
g:: (b2 -> c2) -> (a2 -> b2) -> (a2 -> c2)

b ~ b1 -> c1
c ~ (a1 -> b1) -> (a1 -> c1)

a ~ (b2 -> c2)
b ~ (a2 -> b2) -> (a2 -> c2)

b1 ~ a2 -> b2
c1 ~ a2 -> c2

a -> c ~ (b2 -> c2) -> (a1 -> a2 -> b2) -> a1 -> a2 -> c2


