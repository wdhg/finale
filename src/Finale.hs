module Finale where

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
join [] _
  = []
join [item] _
  = item
join (headItems : tailItems) separator
  = headItems ++ (separator : join tailItems separator)
