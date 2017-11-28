module Challenges08 where

import           Control.Applicative
import           Data.Functor.Identity

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

-- Challenge 2 - Maybe'
type Maybe' a = Either (Const () a) (Identity a)

maybeToMaybe' :: Maybe a -> Maybe' a
maybeToMaybe' Nothing  = Left (Const ())
maybeToMaybe' (Just x) = Right (Identity x)

maybe'ToMaybe :: Maybe' a -> Maybe a
maybe'ToMaybe (Left (Const ()))    = Nothing
maybe'ToMaybe (Right (Identity x)) = Just x

-- Challenge 3 - PreList
data PreList a b
    = Nil
    | Cons a
           b

type PreList' a b = Either (Const () a) (Identity (a, b))

preListToPreList' :: PreList a b -> PreList' a b
preListToPreList' Nil        = Left (Const ())
preListToPreList' (Cons x y) = Right (Identity (x, y))

preList'ToPreList :: PreList' a b -> PreList a b
preList'ToPreList (Left (Const ()))         = Nil
preList'ToPreList (Right (Identity (x, y))) = Cons x y

instance Bifunctor PreList where
    bimap _ _ Nil        = Nil
    bimap g h (Cons a b) = Cons (g a) (h b)