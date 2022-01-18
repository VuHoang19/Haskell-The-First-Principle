## Monoid
- a monoid is a binary associate operation with an identity
- a monoid is a function that takes two arguments and follows two laws: associativity and identity
- Associativity means the arguments can be regrouped (or reparenthesized, or reassociated) in different orders and give the same result, as iin addition.
- Identity means there exists some value such that when we pass it as nput in our funciton, the operation is rendered moot and the other value is returned, such as when we add zero or multiply by one.
- Monoid is the typeclass that generalizes these laws across types
    - binary
    - associative
    - having an identity value
- each type should only have one unique instance for a given typeclass, not two
- Integers form a monoid under summation and multiplication

- newtype is like a single-member C union that avoids creating an extra pointer, but still gives you a new type constructor and data constructor so you don't mix up the many many many things that share a single representation

- why use newtype:
    - to signal intent: using newtype makes it clear that you only intend for it to be a wrapper for the underlying type. The newtype cannot eventually grow into a more complicated sum or product type, which a normal datatype can
    - to improve type safety: avoid mixing up many values of the same representation, such as Text or Integer
    - to add different typeclass instances to a type that is otherwise unchanged representationally, such as with Sum and Product

- mappend: (<>)
- other law for monoid: the binary operation myst be associative and it must have a sensible identity value

## Orphan instance
- an orphan instance is when an instance if defined for a datatype and typeclass, but not in the same module as either the declaration of the typeclass or the datatype.
- an orphan instance is a type class instance of class C and type T which is neither defined in the module where C is defined nor in the module where T is defined
- all instances defined in a module A are imported automatically when importing A, or importing any module that imports A, directly or indirectly.
- solutions for addressing orphan instances:
    - define the type but not the typeclass? Put the instance in the same module as the type so that the type cannot be imported without its instances
    - defined the typeclass but not the type. Put the instance in the same module as the typeclass defiition so that the typeclass cannot be imported without its instances
    - neither the type nor the typeclass are yours? Define your own newtype wrapping the original type and now you're got a type that "belongs" to you for which you can rightly define typeclass instances.

- Semi group
    class Semigroup a where
        (<>) :: a -> a -> a
    
    one law: (a <> b) <> c = a <> (b <> c)
- (<>) is only requires a Semigroup constraint rather than a Monoid constraint

- NonEmpty is a product of two arguments

## Definitions
1. a monoid is a set that is closed under an associative  binary operations and has an identity element. Closed is the posh mathematical way of saying its type is:
    mappend :: m -> m -> m 
    (arguments and output will always inhabit the same type (set)))

2. a semigroup is a set that is closed under an associative binary operation - and nothing else 

3. Laws are rules about how an algebra or structure should behave.


