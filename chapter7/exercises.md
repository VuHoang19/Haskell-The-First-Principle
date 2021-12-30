## Chapter Exercises
1. A polymorphic function may resolve to values of different types, depending on inputs
2. Two functions named f and g have types Char -> String and String -> [String] respectively. The composed function g . f has the type Char -> [String]
3. A function f has the type Ord a => a -> a -> Bool and we apply it to one numeric value. The type now is (Ord a, Num a) => a -> Bool
4. A function with the type (a -> b) -> c is a higher-order function
5. f :: a -> a
   f x = x

   f True :: Bool
