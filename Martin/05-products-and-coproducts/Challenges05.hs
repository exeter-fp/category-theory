module Challenges05 where

import           Data.Either

-- Challenge 5
-- Show that `Either` is a 'better' coproduct than `int` equipped with injections
--  ```
--  int i(int n) { return n; }
--  int j(bool b) { return b ? 0 : 1 }
-- `m` is the function that factorises `i` and `j`
m :: Either Int Bool -> Int
m (Left a) = a
m (Right b) =
    if b
        then 0
        else 1