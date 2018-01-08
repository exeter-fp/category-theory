module Challenges10 where

-- Challenge 1
-- Natural transformation from `Maybe` to `[]`
maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just x) = [x]

-- Challenge 2
-- Natural transformations between Reader () and []
newtype Reader e a =
    Reader (e -> a)

empty :: Reader () a -> [a]
empty (Reader _) = []

singleton :: Reader () a -> [a]
singleton (Reader g) = [g ()]

-- Challenge 3
-- Natural transformations between Reader Bool and Maybe
alwaysNothing :: Reader Bool a -> Maybe a
alwaysNothing (Reader _) = Nothing

applyFalse :: Reader Bool a -> Maybe a
applyFalse (Reader g) = Just $ g False

applyTrue :: Reader Bool a -> Maybe a
applyTrue (Reader g) = Just $ g True
