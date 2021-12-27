## What are types?
- types are how we group a set of values together that share something in common
## Anatomy of a data declaration
- data declarations are how datatypes are defined
```
-- the definition of Bool
data Bool = False | True
```

## Numeric types

### Integral numbers
- Int: is a fixed-precision integer (min, max)
- Integer: is also for integer but supports arbitratily large (or small) numbers
### Fractional
- Float: used for single-precision floating point number (numbers of digits after the decimal point)
- Double: is a double-precision floating point number type. (twice bits as Float type)
- Rational: represents a ratio of two integers
- Scientific: stores the coefficient as an Integer and the exponent as an Int

These numeric datatypes all have instances of a typeclass called Num

- Typeclasses are a way of adding functionality to types that is reusable across all the types that have instances of that typeclass
- Num is a typeclass for which most numeric types

## Conditionals with if-then-else

```
if CONDITION
then EXPRESSION_A
else EXPRESSION_B
```

## Tuples
- is a type that allows you to store and pass around multiple values within a single value

## Lists
- used to contain multiple values within a single value
- all elements of a list must be of the same type
- list have their own distinct [] syntax
- the number of values in lists isn't specified

## Definitions
- a tuple is an ordered grouping of values.  In Haskell, you cannot have a tuple with only one element, but there is a zero tuple also called unit or (). The types of the elements of tuples are allowed to vary
- a typeclass is a set of operations defined with respect to a polymorphic type
- data constructors in Haskell provide a means of creating values that inhabit a given type.
- type constructors in Haskell are not values and can only be used in type signatures
- data declarations define new datatypes in Haskell.
- a type alias is a way to refer to a type constructor or type constant by an alternate name, usually to communicate something more specific or for brevity
- Arity is the number of arguments a function accepts
- Polymorphism in Haskell means being able to write code in terms of values which may be one of several, or any, type
