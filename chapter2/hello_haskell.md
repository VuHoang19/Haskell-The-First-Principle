## Interacting with Haskell code
- REPL is an acronym short for read-eval-print loop
- Prelude is a library of standard functions

## Understanding expressions
- expressions may be values, combinations of values, and/or functions applied to values
- expressions evaluate to a result

## Functions
- a function is an expression that is applied to an argument and always returns a result
- all functions in Haskell take one argument and return one result
- currying: applying a series of nested functions, each to one argument

## Evaluation
- Haskell uses a nonstrict evaluation (sometimes called "lazy evaluation") strategy which defers evaluation of terms util they're forced by other terms referring to them

## Definitions
- a paramete, or formal parameter, represemts a value that will be passed to the function when the function is called
- parameters are usually variables
- an argument is an input value the function is applied to.
- expression is a combination of symbols that conforms to syntatic rules and can be evaluated to some result
- in Haskell, an expression is a well-structured combination of constants, variables, and functions
- a value is an expression that cannot be reduced or evaluated any further
- a function is a mathematical object whose capabilities are limited to being applied to an argument and returning a result.
- infix notation is the style used in arithmetic and logic. Infix means that the operator is placed between the operands or arguments.
- operators are functions that are infix by default
- syntactic sugar is syntax within a programming language designed to make expressions easier to write or read.