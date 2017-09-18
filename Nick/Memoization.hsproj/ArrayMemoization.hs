module ArrayMemoization where
  
-- from https://news.ycombinator.com/item?id=1531441

import Data.Array
    
f :: Integer -> Integer
f n = sum [0..n]
    
largeNumber = round 2e6 :: Integer
    
memo_f :: Array Integer Integer
memo_f = listArray (0,largeNumber) [ (f n) | n <- [0..largeNumber] ] 
    
    
main = do
    putStrLn (show (memo_f!largeNumber))     -- slow
    putStrLn (show (memo_f!(largeNumber-1))) -- slow
    putStrLn (show (memo_f!(largeNumber)))   -- fast
    putStrLn (show (memo_f!(largeNumber-1))) -- fast
    putStrLn (show (memo_f!(largeNumber-2))) -- slow
    putStrLn (show (memo_f!(largeNumber-3))) -- slow
    putStrLn (show (memo_f!(largeNumber)))   -- fast
    putStrLn (show (memo_f!(largeNumber-2))) -- fast
    putStrLn (show (memo_f!(largeNumber-4))) -- slow
    putStrLn (show (memo_f!(largeNumber-5))) -- slow