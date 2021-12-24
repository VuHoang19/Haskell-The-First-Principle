## A first look at types
- types are a way of categorizing values
- types for numbers: integers, fractional numbers, etc
- type for boolean values: True, False
- strings are lists of characters

```
Prelude> :type 'a'
'a' :: Char
```

```
Prelude> :type "Hello!"
"Hello!" :: [Char]
```

## Printing simple strings
- print function is not specific to strings or text
- print can be used to print different types of data to the screen
```
Prelude> print "hello world!"
"hello world!"
```
- putStr and putStrLn print the string to the display without the quotation marks

```
Prelude> putStrLn "hello world!"
hello world!
```

- do syntax is a special syntax that allows for sequencing actions

```
main :: IO ()
main = do
putStrLn "Count to four for me:"
putStr "one, two"
putStr ", three, and"
putStrLn " four!

```

## Types of concatenation functions
- concatenate strings with (++) and concat
```
++ has the type [a] -> [a] -> [a]
concat has the type [[a]] -> [a]
```

## Definition
- a String is a sequence of characters
- a type or datatype is a classificaiton of values or data
- concatenation is the joining together of sequences of values
- scope is where a variable referred to by name is valid
- local bindings are bindings local to particular expressions
- top level bindings in Haskell are bindings that stand outside of any other declaration
- data structures are a wau of organizing data so that the data can be accessed
