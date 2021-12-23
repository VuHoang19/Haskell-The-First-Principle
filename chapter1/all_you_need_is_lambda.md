## Lambda
- a calculus is a method of calculation or reasoning
- the lambda calculus is one process for formalizing a method
- lambda calculus formalizes the concept of effective computability, thus determining which problems, or classes of problems, can be solved
- Haskell is a lambda calculus

## What is functional programming?
- functional programming is a computer programming paradigm that relies on functions modeled on mathematical functions.
- programs are a combination of expressions
- based on the lambda calculus
- Haskell is a pure functional language what is more properly called referential transparency: the same function, given the same values to evaluate, will always return the same result as they do in math

## What is a function?
- a function is a relation between a set of possible inputs and a set of possible outputs
- the function itself defines and represents the relationship

## The structure of lambda terms
- the lambda calculus has three basic components, or lambda terms: expressions, variables, and abstractions
- an abstraction is a function. It is a lambda term that has a head (a lambda) and a body and is applied to an argument (an input value)

### Alpha equivalence

there 's a form of equivalence between lambda terms called alpha equivalence

### Beta reduction
When we apply a function to an argument, we substitute the input expression for all instances of bound variables within the body of the abstraction. You also eliminate the head of the abstraction, since its only purpose was to bind a variable. This process is called beta reduction

### Free variables
- The purpose of the head of the function is to tell us which variables to replace when we apply our function, that is, to bind the variables
- Free variables are the variables that are not named in the head

### Multiple arguments
- Each lambda can only bind one parameter and can only accept one argument
- Functions that require multiple arguments have multiple, nested heads

## Evaluation is simplification
- Beta normal form is when you cannot beta reduce (apply lambdas to arguments) the terms any further

## Combinators
- a combinator is a lambda term with no free variables

## Divergence
- divergence means that the reductionn process never terminates or ends

## Summary
- functional programming is based on expressions that include variables or constant values, expressions combined with other expressions, and functions
- functions have a head and a body and are those expressions that can be applied to arguments and reduced, or evaluated, to a result
- variables may be bound in the function declaration, and every time a bound variable shows up in a function, it has the same value
- all functions take one argument and return one result
- functions are a mapping of a set of inputs to a set of outputs. Given the same input, they always return the same result