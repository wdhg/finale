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
  λ count 1 [1, 1, 2, 1, 3, 4]
  3
  λ count 5 [1,2,3,4]
  0
  ```

- `insert` inserts an item into a list at a position. For example:
  ```Haskell
  λ insert 3 99 [0,1,2,3,4]
  [0,1,2,99,3,4]
  λ insert 3 1 [0,0,0]
  [0,0,0,1]
  λ insert 3 'a' "banna"
  "banana"
  ```

- `separate` splits a list of items on a given separator. For example:
  ```Haskell
  λ separate ' ' "hello my name is"
  ["hello","my","name","is"]
  λ separate 0 [1,2,3,0,4,5,6,0,7,8,9]
  [[1,2,3],[4,5,6],[7,8,9]]
  ```

- `join` undos a separation by concatenating the split items with a separator.
  For example:
  ```Haskell
  λ join ' ' ["hello","my","name","is"]
  "hello my name is"
  λ join 0 [[1,2,3],[4,5,6],[7,8,9]]
  [1,2,3,0,4,5,6,0,7,8,9]
  ```

- `replace` replaces all occurances of an element with another element. For
  example:
  ```Haskell
  λ replace 'u' 'a' "bununu"
  "banana"
  λ replace 0 3 [0,1,2,0,1,2]
  [3,1,2,3,1,2]
  ```

- `mapIf` maps a function over some items in a list if they satisfy some
  predicate. For example:
  ```Haskell
  λ mapIf even succ [0,1,2,3,4,5]
  [1,1,3,3,5,5]
  λ mapIf (== 'u') (const 'a') "bununu"
  "banana"
  ```
