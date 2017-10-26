module SADTs where

import           Data.Either



-- The distributive law
-- a * (b + c) = a * b + a * c

-- Analogy is
-- (a, Either b c) <-> Either (a, b) (a, c)

-- Here are the two functions that demonstrate the isomorphism

prodToSum :: (a, Either b c) -> Either (a, b) (a, c)
prodToSum (x, e) =
    case e of
         Left y  -> Left  (x, y)
         Right z -> Right (x, z)

sumToProd :: Either (a, b) (a, c) -> (a, Either b c)
sumToProd e =
    case e of
         Left  (x, y) -> (x, Left  y)
         Right (x, z) -> (x, Right z)