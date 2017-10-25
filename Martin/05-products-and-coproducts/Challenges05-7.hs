module Challenges05_7 where

import           Data.Either

-- Challenge 7
i :: Int -> Int
i n
    | n < 0 = n
    | otherwise = n + 2

j :: Bool -> Int
j True  = 0
j False = 1

m :: Int -> Either Int Bool
m 0 = Right True
m 1 = Right False
m n
    | n < 0 = Left n
    | otherwise = Left (n - 2)