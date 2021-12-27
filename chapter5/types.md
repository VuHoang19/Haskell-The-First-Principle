## What are types for?
 - type is static
 - typechecking occurs at compile time -> That means many errors will be caight before you try to execute, or run your program
 - types can also serve as documentation of your program, which is one reason we encourage you to declare types (that is write the signatures) for your function.

 ## Currying
 - all functions in Haskell take one argument and return one result
 - Currying refers to the nesting of multiple functions, each accepting one argument and returning one reesult, to allow the illusion of multiple-parameter functions

 ### Partial application
 ### Manual curring and uncurrying
 - haskell is curried by default
 - uncurrying means un-nesting the functions and replacing the two functions with a tuple of two values
 a => a -> a -> a to Num a => (a,a) -> a
 - uncurried functions: One function, many arguments
 - curried functions: many functions , one argument apiece

## Polymorphism
- polymorphic type variables give us the ability to implement expressions that can accept arguments and return results of different types without having to write variations on the same expression for each type.
- in haskell, polymorphism divides into two categories: parametric polymorphism and constraned polymorphism

## Definition
1. Polymorphism refers to type variables which may refer to more than one concrete type
2. Type inference is a faculty some programming languages, most notably Haskell and ML, have to infer principal types from terms without needing explicit type annotations.
a
Num a => a
Int

-- the principal type here is the parametrically polymorphic 'a'

3. Type variable is a way to refer to an unspecified type or set of types in Haskell type signatures.

4. A typeclass is a means of expressing faculties or interfaces that multiple datatypes may have in common.

5. Parametricity is the property that holds in the presence of parametric polymorphism