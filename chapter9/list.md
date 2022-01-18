## WHNF , NF
- any thing in normal form is by definition also in weak head normal form, because weak head is an expression which is evaluated up to at least the first data constructor.
- Normal form exceeds that by requiring that all subexpressions be fully evaluated

## Definitions
- a product type is a type made of a set of types compounded over each other
- a sum type of two types is a type whose terms are terms in either type, but not simultaneously.
- Cons is ordinarily used as a verb to signify that a list value has been created by cons’ing a value onto the head of another list value.
- Cons cell is a data constructor and a product of the types a and [a] as defined in the list datatype
- The spine is a way to refer to the structure that glues a collection of values together