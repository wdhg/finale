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
