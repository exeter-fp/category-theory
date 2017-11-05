# Simple Algebraic Data Types

- For product type, () is terminal, i.e. moniodal construction
- (string,bool) not same (bool,string), but is Isomorphic by using swap function
- i.e. not commutative, but commutative up to isomorphism
- can nest pairs, but that is isomorphic to tuples
- like monoid, but composing equally only 'up to isomorphism'
- Set is a monodial cateogory with product and terminal
- Tuple (generic) -> Record (named)
- In haskell `data Pair a b = P a b // where P is a constructor`
- Either or Choice (generic) -> Named Sum type (named)
- Set is also a symmetric monodial category with respect to CoProduct (Either) and Initial (Void), + and 0. 
- Seminring: intwined product and sum monoids. Not full ring, because subtraction can't be defined.
- Logic. False is Void, True is (), || is sum, && is product
- Counting of types e.g. Option a = 1 + a
- List = 1 + a + a*a + a*a*a + .... infite sum
