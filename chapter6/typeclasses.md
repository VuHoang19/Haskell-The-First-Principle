## What are typeclasses?
- a typeclass defines a set of functions and/or values
- types have instances of that type class
- the instances specify the way that type uses the functions of the typeclass

## Chapter Definitions
1. Typeclass inheritance is when a typeclass has a superclass.

2. Effects are how we refer to observable actions programs may take other than compute a value.  If a function modifies some state or interacts with the outside world in a manner that can be observed, then we say it has an effect on the world

3. IO is the type for values whose evaluation bears the possibility of causing side effects, such as printing text, reading text input from the user, reading or writing files, or connecting to remote computers.

4. An instance is the definition of how a typeclass should work for a given type. Instances are unique for a given combination of typeclass and type.

5. . In Haskell we have derived instances so that obvious or common typeclasses, such as Eq, Enum, Ord, and Show can have the instances generated based only on how the datatype is defined. This is so programmers can make use of these conveniences without writing the code themselves, over and over