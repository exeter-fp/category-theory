module Challenges06 where

-- Challenge 1 - Show the isomorphism between `Maybe a` and `Either () a`
maybeToEither :: Maybe a -> Either () a
maybeToEither Nothing  = Left ()
maybeToEither (Just x) = Right x

eitherToMaybe :: Either () a -> Maybe a
eitherToMaybe (Left ()) = Nothing
eitherToMaybe (Right x) = Just x

-- Challenge 6 - show that `a + a = 2 * a` holds for types up to isomorphism
sumToProduct :: Either a a -> (Bool, a)
sumToProduct (Left x)  = (False, x)
sumToProduct (Right y) = (True, y)

productToSum :: (Bool, a) -> Either a a
productToSum (False, x) = Left x
productToSum (True, y)  = Right y