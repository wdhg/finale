# Finale

Finale is a custom extension to the Prelude library of functions that I wish
existed in it.

## Features

- `??` is a safe function to complement `!!`. It returns a `Maybe` of the index
  of the first occurance of an item in a list.
  For example:
  ```Haskell
  λ "hello" ?? 'e'
  Just 1
  λ [0..10] ?? 4
  Just 4
  λ [0..5] ?? 10
  Nothing
  ```

- `count` is a function which counts the occurances of an item in a list. For
  example:
  ```Haskell
  λ [1, 1, 2, 1, 3, 4] `count` 1
  3
  λ [1,2,3,4] `count` 5
  0
  ```


