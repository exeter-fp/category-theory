module Challenges08 where

class Bifunctor f where
    bimap :: (a -> c) -> (b -> d) -> f a b -> f c d
    bimap g h = first g . second h
    first :: (a -> c) -> f a b -> f c b
    first g = bimap g id
    second :: (b -> d) -> f a b -> f a d
    second = bimap id

data Pair a b =
    Pair a
         b
    deriving (Eq, Show)

-- Challenge 1 - `bifunctor` instance for `Pair`
instance Bifunctor Pair where
    bimap g h (Pair a b) = Pair (g a) (h b)
    first g (Pair a b) = Pair (g a) b
    second h (Pair a b) = Pair a (h b)