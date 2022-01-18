## Foldr
- cannot use foldr with addition on an infinite list

scanr :: (a -> b -> b) -> b -> [a] -> [b]
foldr :: (a -> b -> b) -> b -> [a] -> b

foldr (:) [] (1 : 2 : 3 : [])
== 1 : (2 : (3 : []))

scanr (+) 0 [1..3]
[1 + (2 + (3 + 0)), 2 + (3 + 0), 3 + 0, 0]

scanl :: (b -> a -> b) -> b -> [a] -> [b]
foldl :: (b -> a -> b) -> b -> [a] -> b

foldl (:) [] [1,2,3]
((([] : 1) : 2) : 3)

scanl (+) 0 [1..3]
[0, 0 + 1, 0 + 1 + 2, 0 + 1 + 2 + 3]

## Definitions
- a fold is a higher-order function which, given a function to accumulate the results and a recursive data structure, returns the built up value.
- a catamorphism is a generalization of folds to arbitrary datatyppes. a catamorphism is a means of breaking down the structure of any datatype
- a tail call is the final result of a function
- tail recursion is a function whose tail calls are recursive invocations of itself