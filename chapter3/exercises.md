## Scope
1.
```
λ> let x = 5
λ> let y = 7
λ> let z = x * y
λ> z
35
```

2.
```
λ> let f = 3
λ> let g = 6 * f + h

<interactive>:8:17: error: Variable not in scope: h
```

3. 
```
λ> area d = pi * (r*r)

<interactive>:9:16: error: Variable not in scope: r

<interactive>:9:18: error: Variable not in scope: r
λ> r = d/2

<interactive>:10:5: error: Variable not in scope: d
```

4.
```
λ> area d = pi * (r * r) where r = d / 2
λ> area 3
7.0685834705770345
```

## Syntax errors
1.
```
λ> ++ [1,2,3] [4,5,6]

<interactive>:16:1: error: parse error on input ‘++’
```
2. 
```
λ> '3' ++ ' Haskell'

<interactive>:17:8: error:
    • Syntax error on 'Haskell'
      Perhaps you intended to use TemplateHaskell or TemplateHaskellQuotes
    • In the Template Haskell quotation 'Haskell'
```
3.
```
λ> concat ["<3", " Haskell"]
"<3 Haskell"
```

## Chapter exercises
### Reading syntax
1.
```
λ> concat [[1,2,4], [4,5,6]]
[1,2,4,4,5,6]

λ> ++ [1,2,3] [4,5,6]

<interactive>:23:1: error: parse error on input ‘++’

λ> (++) "hello" "world"
"helloworld"

λ> ["hello" ++ " world"]
["hello world"]

λ> 4 !! "hello"

<interactive>:26:6: error:
    • Couldn't match expected type ‘Int’ with actual type ‘[Char]’
    • In the second argument of ‘(!!)’, namely ‘"hello"’
      In the expression: 4 !! "hello"
      In an equation for ‘it’: it = 4 !! "hello"

λ> (!!) "hello" 4
'o'

λ> take " 4 lovely"

<interactive>:28:6: error:
    • Couldn't match expected type ‘Int’ with actual type ‘[Char]’
    • In the first argument of ‘take’, namely ‘" 4 lovely"’
      In the expression: take " 4 lovely"
      In an equation for ‘it’: it = take " 4 lovely"
λ> take 3 "awesome"
"awe"
```
2.
ad - bc - ce - da - eb

### Building functions
1.
a.
```
λ> "Curry is awesome" ++ "!"
"Curry is awesome!"
```
b.
```
λ> "Curry is awesome!" !! 4
'y'
```
c.
```
λ> drop 9 "Curry is awesome!"
"awesome!"
```