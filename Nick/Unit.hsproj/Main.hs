import Data.Void

-- difference between:
-- * 'Void' "a type not inhabited by any values"
-- * '()' - unit "corresponds to the singleton set. It's a type that has only one possible value. This value just "is.""

-- Question 'MyType' is that the same an unit? 

absurd :: Void -> a
absurd _ = "hello"

data MyType = AConstructor



f1 :: Integer
f1 = 44

f2 :: () -> Integer
f2 _ = 44

