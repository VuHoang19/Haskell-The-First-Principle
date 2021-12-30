## Point free
- higher-order functions are fucntions that accept functions as arguments
- function composition is a type of higher-order function that allow us to combine functions such that the result of applying one function gets passed to the next function as an argument

## Chapter definition
1. Binding or bound is a common word used to indicate connection, linkage, or association between two objects.

2. An anonymous function is a function which is not bound to an identifier and is instead passed as an argument to another function and/or used to construct another function.

3. Currying is the process of transforming a function that takes multiple arguments into a series of functions which each take one argument and return one result. This accomplished through nesting. In Haskell, all functions are curried by default.

4. Pattern matching is a syntactic way of deconstructing product and sum types to get at their inhabitants. Pattern matching is about your data

5. Bottom is a non-value used to denote that the program cannot return a value or result.

6. Higher-order functions are functions which themselves take functions as arguments or return functions as results.

7. Composition is the application to the result of having applied another function. The composition operator is a higher-order function as it takes the functions it composes as a arguments and then returns a function of the composition

8. Pointfree is programming tacitly, or without mentioning arguments by name. This tends to look like "plumby" code where you're routing data around implicity or leaving off unnecessary arguments thanks to currying.