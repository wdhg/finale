module Finale where

import Data.List (intersperse)

(??) :: Eq a => [a] -> a -> Maybe Int
[] ?? _
  = Nothing
(item : remaining) ?? search
  | item == search = Just 0
  | otherwise      = succ <$> remaining ?? search

count :: Eq a => a -> [a] -> Int
count item items
  = length $ filter (== item) items

insert :: Int -> a -> [a] -> [a]
insert index item items
  = before ++ (item : after)
    where
      (before, after) = splitAt index items

separate :: Eq a => a -> [a] -> [[a]]
separate _ []
  = [[]]
separate separator (item : items)
  | item == separator = [] : remaining
  | otherwise         = (item : headItems) : tailItems
    where
      remaining@(headItems : tailItems)
        = separate separator items

join :: a -> [[a]] -> [a]
join separator items
  = concat $ intersperse [separator] items

replace :: Eq a => a -> a -> [a] -> [a]
replace from to items
  = map replace' items
    where
      replace' item
        | item == from = to
        | otherwise    = item

mapIf :: (a -> Bool) -> (a -> a) -> [a] -> [a]
mapIf predicate func items
  = map mapIf' items
    where
      mapIf' item
        | predicate item = func item
        | otherwise      = item

sieve :: (a -> Bool) -> [a] -> ([a], [a])
sieve predicate
  = foldr sieve' ([], [])
    where
      sieve' item (left, right)
        | predicate item = (item : left, right)
        | otherwise      = (left, item : right)
