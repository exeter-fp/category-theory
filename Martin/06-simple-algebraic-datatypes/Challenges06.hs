module Challenges06 where

-- Challenge 1 - Show the isomorphism between `Maybe a` and `Either () a`
maybeToEither :: Maybe a -> Either () a
maybeToEither Nothing  = Left ()
maybeToEither (Just x) = Right x

eitherToMaybe :: Either () a -> Maybe a
eitherToMaybe (Left ()) = Nothing
eitherToMaybe (Right x) = Just x