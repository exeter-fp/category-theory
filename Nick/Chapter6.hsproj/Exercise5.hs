module Exercise5 where
  
eitherToPair :: Either a a -> (Bool, a)
eitherToPair (Left x) = (False, x)
eitherToPair (Right x) = (True, x)

pairToEither :: (Bool, a) -> Either a a
pairToEither (False, x) = Left x
pairToEither (True, x) = Right x