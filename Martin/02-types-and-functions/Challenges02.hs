module Challenges02 where

import Data.Void

main :: IO ()
main = undefined

voidunit :: Void -> ()
voidunit _ = ()

voidid :: Void -> Void
voidid a = a