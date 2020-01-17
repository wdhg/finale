module Finale where

import Data.List (intersperse)

(??) :: Eq a => [a] -> a -> Maybe Int
[] ?? _
  = Nothing
(item : remaining) ?? search
  | item == search = Just 0
  | otherwise      = succ <$> remaining ?? search

count :: Eq a => [a] -> a -> Int
count items item
  = length $ filter (== item) items

insert :: [a] -> a -> Int -> [a]
insert items item index
  = before ++ (item : after)
    where
      (before, after) = splitAt index items

separate :: Eq a => [a] -> a -> [[a]]
separate [] _
  = [[]]
separate (item : items) separator
  | item == separator = [] : remaining
  | otherwise         = (item : headItems) : tailItems
    where
      remaining@(headItems : tailItems)
        = separate items separator

join :: [[a]] -> a -> [a]
join items separator
  = concat $ intersperse [separator] items

replace :: Eq a => [a] -> a -> a -> [a]
replace items from to
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
