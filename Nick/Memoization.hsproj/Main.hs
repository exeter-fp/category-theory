
-- from https://gist.github.com/harpocrates/d1557656a7125048b01a

import qualified Data.Map as M
import Data.IORef
import System.IO.Unsafe
import Fib

-- | Memoize a function. The use of unsafePerformIO is fine since referential transparency is maintained.
-- `memoize f` will return a new function which behaves the same as `f` but memoizes its results everytime
-- it is called with an argument it hasn't seen yet.
memoize :: Ord a => (a -> b) -> (a -> b)
memoize f = \x -> unsafePerformIO $ do
      table <- readIORef dict
      case M.lookup x table of
        (Just y) -> return y
        Nothing  -> do
          let y = f x
          modifyIORef dict $ M.insert x y
          return y
  where
    dict :: IORef (M.Map a b)
    dict = unsafePerformIO $ newIORef M.empty
    

-- see also Hacker news:
-- https://news.ycombinator.com/item?id=1532484
-- https://news.ycombinator.com/item?id=1531441

