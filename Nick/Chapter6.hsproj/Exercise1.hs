-- Show the isomorphism between Maybe a and Either () a
module Exercise1 where

maybeToEither :: Maybe a -> Either () a
maybeToEither Nothing = Left ()
maybeToEither (Just a) = Right a

eitherToMaybe :: Either () a -> Maybe a 
eitherToMaybe (Left ()) = Nothing
eitherToMaybe (Right a) = Just a

