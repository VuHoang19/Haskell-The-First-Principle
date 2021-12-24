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
