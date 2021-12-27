## Type matching
- _ :: [a] -> a
head
- _ :: [[a]] -> [a]
concat
- _ :: Bool -> Bool
not
- _ :: [a] -> Int
length
- :: Ord a => a -> a -> Bool
(<)

## Type Arguments
1. a -> a -> a -> Char
2. Char
3. Num b => b
4. Double
5. [Char]
6. Eq b => b -> [Char]
7. (Num a, Ord a) => a
8. (Num a, Ord a) => a
9. Integer

## Parametricity

## Apply yourself
1.
(++) :: [Char] -> [Char] -> [Char]
2.
(*) :: Fractional a => a -> a -> a
3.
take :: Int -> [Char] -> [Char]
4.
(>) :: Int -> Int -> Bool
5.
(<) :: Char -> Char -> Bool

## Chapter Exercise
1. a value of type [a] is a list of whose elements are all of some type a
2. a function of type [[a]] -> [a] could take a list of strings as an argument
3. a function of type [a] -> Int -> a returns one element of type a from a list
4. a function of type (a, b) -> a takes a tuple argument and returns the first value

### Determine the type
1.
a. (* 9) 6
54 :: Num a => a
b. head [(0, "doge"), (1, "kitchen")]
(0, "doge") :: Num a => (a, [Char])
c. head [(0 :: Integer, "doge"), (1, "kitchen")]
(0, "doge") :: (Integer, [Char])
d. if False then True else False
False :: Bool
e. length [1,2,3,4,5]
5 :: Int
f. (length [1,2,3,4]) > (length "TACOCAT")
False :: Bool

2.
Num a => a
3.
Num a => a -> a
4. 
Fractional a =. a
[Char]

## Type variable or specific type constructor
2.
f :: zed -> Zed -> Blah
zed: Fully polymorphic
Zed: Concrete type constructor
Blah: Concrete type constructor
3.
f :: Enum b => a -> b -> C
a: Fully polymorphic type variable
b: constrained polymorphic type
c: concrete type constuctor
4.
f :: f -> g -> C
f: Fully polymorphic type variable
g: Fully polymorphic type variable
C: Concrete type constructor

## Write a type signature
1.
functionH :: [a] -> a
2.
functionC :: Ord a => a -> a -> Bool
3.
functionS :: (a, b) -> b

## Given a type, write the function
1. i a = a
2. c a b = a
3. c '' b a = b
4. c' a b = b
5. r = rail
   r = reverse
   