## Mood wing
```
data Mood = Blah | Woot deriving Show
```
- type constructor: Mood
- values: Blah, or Woot
- Woot is a data constructorm not a type signature

```
changeMood Blah = Woot
changeMood _    = Blah
```

```
data Mood = Blad | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah
```

## Find the Mistakes
1.
```
Prelude> not True && true

<interactive>:3:13: error:
    • Variable not in scope: true :: Bool
    • Perhaps you meant data constructor ‘True’ (imported from Prelude)
```
2. 
```
Prelude> not (x = 6)

<interactive>:4:8: error:
    parse error on input ‘=’
    Perhaps you need a 'let' in a 'do' block?
    e.g. 'let x = 5' instead of 'x = 5'
```
3. 
```
Prelude> (1*2) > 5
False
```
4.
```
Prelude> [Merry] > [Happy]

<interactive>:6:2: error:
    Data constructor not in scope: Merry :: ()

<interactive>:6:12: error:
    Data constructor not in scope: Happy :: ()
```
5.
```
Prelude> [1, 2, 3] ++ "look at me!"

<interactive>:7:2: error:
    • No instance for (Num Char) arising from the literal ‘1’
    • In the expression: 1
      In the first argument of ‘(++)’, namely ‘[1, 2, 3]’
      In the expression: [1, 2, 3] ++ "look at me!"
```
## Chapter exercises
```
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]
```

1. 
```
length :: [a] -> Integer
```
2.
a.
```
Prelude> length [1,2,3,4,5]
5
```
b.
```
Prelude> length [(1,2), (2,3), (3,4)]
3
```
c.
```
Prelude> length allAwesome
2
```
d.
```
Prelude> length (concat allAwesome)
5
```

3.
```
Prelude> length (concat allAwesome)
5
```

```
Prelude> 6 / length [1, 2, 3]

<interactive>:16:1: error:
    • No instance for (Fractional Int) arising from a use of ‘/’
    • In the expression: 6 / length [1, 2, 3]
      In an equation for ‘it’: it = 6 / length [1, 2, 3]
```

4.
```
Prelude> 6 `div` length [1, 2, 3]
2
```
```
Prelude> 6 `quot` length [1, 2, 3]
2
```

5.
```
Prelude> 2 + 3 == 5
True
```

6.
```
Prelude> x + 3 == 5
False
```

7.
```
Prelude> length allAwesome == 2
True
Prelude> length [1, 'a', 3, 'b']

<interactive>:23:9: error:
    • No instance for (Num Char) arising from the literal ‘1’
    • In the expression: 1
      In the first argument of ‘length’, namely ‘[1, 'a', 3, 'b']’
      In the expression: length [1, 'a', 3, 'b']
Prelude> length allAwesome + length awesome
5
Prelude> (8 == 8) && ('b' < 'a')
False
Prelude> (8 == 8) && 9

<interactive>:27:13: error:
    • No instance for (Num Bool) arising from the literal ‘9’
    • In the second argument of ‘(&&)’, namely ‘9’
      In the expression: (8 == 8) && 9
      In an equation for ‘it’: it = (8 == 8) && 9
```
8.
```
isPlindrome :: (Eq a) => [a] -> Bool
isPalindrome x = reverse x == x
```
9.
```
myAbs :: Integer -> Integer
myAbs x = if x > 0 then x else negate x
```
10.
```
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f l r = ((snd l, snd r), (fst l, fst r))
```

### Correcting syntax
1.
```
x = (+)

F xs = w `x` 1
    where w = length xs
```
2.
```
\x -> x
```
3.
```
\(x:xs) -> x
```
4.
f (a b) = a

### Match the function names to their types
1
```
Show a => a -> String
```
2. 
```
Eq a => a -> a -> Bool
```
3. fst
```
(a, b) -> a
```

4.
```
(+) :: Num a => a -> a -> a
```