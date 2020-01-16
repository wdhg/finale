# Interlude

Interlude is a custom extension to the Prelude library of functions that I wish
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


