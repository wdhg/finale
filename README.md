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

- `insert` inserts an item into a list at a position. For example:
  ```Haskell
  λ insert [0,1,2,3,4] 99 3
  [0,1,2,99,3,4]
  λ insert [0,0,0] 1 3
  [0,0,0,1]
  λ insert "banna" 'a' 3
  "banana"
  ```

- `separate` splits a list of items on a given separator. For example:
  ```Haskell
  λ separate "hello my name is" ' '
  ["hello","my","name","is"]
  λ separate [1,2,3,0,4,5,6,0,7,8,9] 0
  [[1,2,3],[4,5,6],[7,8,9]]
  ```
