module Finale where

import Data.List (intersperse)

(??) :: Eq a => [a] -> a -> Maybe Int
[] ?? _
  = Nothing
(item : remaining) ?? search
  | item == search = Just 0
  | otherwise      = succ <$> remaining ?? search

applyN :: Int -> (a -> a) -> a -> a
applyN n func x
  | n > 0     = applyN (n - 1) func $ func x
  | otherwise = x

count :: Eq a => a -> [a] -> Int
count item items
  = length $ filter (== item) items

find :: Eq a => [a] -> [a] -> Maybe Int
find _ []
  = Nothing
find pattern items@(_ : remaining)
  | starting == pattern = Just 0
  | otherwise           = (1 +) <$> find pattern remaining
    where
      starting
        = take (length pattern) items

insert :: Int -> a -> [a] -> [a]
insert index item items
  = before ++ (item : after)
    where
      (before, after) = splitAt index items

join :: a -> [[a]] -> [a]
join separator items
  = concat $ intersperse [separator] items

mapIf :: (a -> Bool) -> (a -> a) -> [a] -> [a]
mapIf predicate func items
  = map mapIf' items
    where
      mapIf' item
        | predicate item = func item
        | otherwise      = item

mean :: Fractional a => [a] -> a
mean values
  = (sum values) / (fromIntegral $ length values)

replace :: Eq a => a -> a -> [a] -> [a]
replace from to items
  = map replace' items
    where
      replace' item
        | item == from = to
        | otherwise    = item

separate :: Eq a => a -> [a] -> [[a]]
separate _ []
  = [[]]
separate separator (item : items)
  | item == separator = [] : remaining
  | otherwise         = (item : headItems) : tailItems
    where
      remaining@(headItems : tailItems)
        = separate separator items

setAt :: Int -> a -> [a] -> [a]
setAt index item items
  | index >= length items = error "index too large"
  | index < 0             = error "negative index"
  | otherwise             = before ++ (item : after)
    where
      (before, (_ : after))
        = splitAt index items

sieve :: (a -> Bool) -> [a] -> ([a], [a])
sieve predicate
  = foldr sieve' ([], [])
    where
      sieve' item (left, right)
        | predicate item = (item : left, right)
        | otherwise      = (left, item : right)

sublist :: Int -> Int -> [a] -> [a]
sublist start end items
  = fst $ splitAt (end - start) excess
    where
      (_, excess)
        = splitAt start items
