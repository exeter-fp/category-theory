module Challenges05_5 where

import           Data.Either

-- Challenge 5
-- Show that `Either` is a 'better' coproduct than `int` equipped with injections
--  ```
--  int i(int n) { return n; }
--  int j(bool b) { return b ? 0 : 1 }
-- `m` is the function that factorises `i` and `j`
i :: Int -> Int
i n = n

j :: Bool -> Int
j True  = 0
j False = 1

m :: Either Int Bool -> Int
m (Left a)      = a
m (Right True)  = 0
m (Right False) = 1