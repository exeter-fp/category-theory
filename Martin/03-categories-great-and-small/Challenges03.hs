module Challenges03 where

newtype All = All
    { getAll :: Bool
    } deriving (Show)

instance Monoid All where
    mempty = All True
    mappend (All x) (All y) = All (x && y)

newtype Any = Any
    { getAny :: Bool
    } deriving (Show)

instance Monoid Any where
    mempty = Any False
    mappend (Any x) (Any y) = Any (x || y)