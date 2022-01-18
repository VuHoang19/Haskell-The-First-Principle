## Applicative
- applicative instance must also have a functor instance
- pure function does a simple and very boring thing: it lifts something into functorial (applicative) structure.

- fmap f x = pure f <*> x

## Identity
- the Identity type here is a way to introduce structure without changing the semantics of what you're doing.