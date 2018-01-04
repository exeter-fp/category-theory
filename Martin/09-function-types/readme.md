# [Chapter 9 - Function Types](https://bartoszmilewski.com/2015/03/13/function-types)

## Notes

- A function type `a -> b` is a set of morphisms between objects `a` and `b` -
  also known as a _hom-set_.

- In the category `Set`, every hom-set is itself an object, because it's a set:

  ![Hom-set in Set is a set](images/set-hom-set.jpg)

- In categories other than `Set`, hom-sets are _external_ to a category:

  ![Hom-set in C is external](images/hom-set.jpg)


### Universal Construction

- A function type can be considered a 'composite' type because it has a
  relationship to the argument and result types.

- When trying to construct a general definition of a function type in a
  category, we'll use a similar approach to that used for product types and
  coproduct types.

- The obvious pattern to connect a function type with its argument and result
  types is _function application_ or _evaluation_:
    - Given a candidate `z` for a function type and the argument type `a`, the
      application maps this pair to the result type `b`.

- If we could look inside objects, we could pair a function `f` in `z` with an
  argument `x` in `a` and map it to `f x` in `b`.

- Instead of dealing with individual objects, consider the whole _product_ of
  the function type with the argument type - i.e. `z x a`, then we can pick a
  morphism that connects `z x a` to `b`

  ![Function pattern](images/function-pattern.jpg)

- If the category doesn't have a product type defined for it, it also doesn't
  have a function type.

- As with construction of the product type, this pattern potentially gives us
  lots of potential hits, so we need to define ranking in order to find the
  'best' pattern.

- To do this, we require that there is a unique mapping between two 'candidate'
  objects `z` and `z'` that 'factorises' our construction.

- `z` together with `g :: z x a -> b` is _better_ than `z'` with `g' :: z' x a
  -> b` iff there is a unique `h :: z' -> z` such that the application of `g'`
  factors through the application of `g` - i.e. `g' = g . (h x id)`

  ![Function ranking](images/function-ranking.jpg)

- Finally, we need to select the object that is universally the best.  We'll
  call this `a=>b`, together with its own application `eval :: (a=>b)xa -> b`.
  This is the 'best' if any other candidate for a function object can be
  uniquely mapped to it in such a way that its application morphism `g`
  factorises through `eval`:

  ![Universal Function Object](images/universal-function-object.jpg)

- The formal definition is thus:

  A function object from `a` to `b` is an object `a=>b` together with the
  morphism:
  ```
  eval :: ((a=>b) × a) -> b
  ```
  such that for any other object `z` with a morphism `g :: z × a -> b` there is
  a unique morphism
  ```
  h :: z -> (a=>b)
  ```
  that factors `g` through `eval`:
  ```
  g = eval ◦ (h × id)
  ```



### Currying

- Now we start thinking of a morphism `g :: z x a -> b` as a morphism of two
  variables `z` and `a`, for a candidate function type `z`.

- The universal property tells us that for each such `g` there is a unique
  morphism `h :: z -> (a=>b)`

- In `Set` this can be interpreted as `h` being a function that takes one
  variable of type `z` and returns a function from `a` to `b` - i.e. `h` is a
  _higher-order function_.

- Therefore the universal construction establishes a 1-1 correspondence between
  functions of two variables and functions or one variable returning functions.

- This is called _currying_, and `h` is called the _curried_ version of `g`.



### Exponentials

- The function object between two objects `a` and `b` is often called the
  _exponential_, denoted <code>b<sup>a</sup></code>.

- For finite-sized types, the cardinality of the function type from `a` to `b`
  is <code>|b|<sup>|a|</sup></code>, where `|a|` represents the cardinality of
  `a`.



### Cartesian Closed Categories

- A _Cartesian closed category_ is a category which contains:
    - A terminal object
    - A product for any pair of objects
    - An exponential for any pair of objects

- We can consider exponentiation as an iterated product, so we can think of a
  cartesian closed category as one that supports products of an arbitrary arity.

- In particular, the terminal object can be considered as the product of zero
  objects.

- Recall that the terminal object and product have duals - the initial object
  and the coproduct.

- A cartesian closed category that also supports an initial object and
  coproduct, with product distributive over coproduct:
  ```
  a x (b + c) = a x b + a x c
  (b + c) x a = b x a + c x a
  ```
  is called a _bicartesian closed category`_.



### Exponentials & Algebraic Data Types

- Function types as exponentials translate well to algebraic data types:
    - `0` corresponds to the initial object
    - `1` corresponds to the terminal object

- <code>a<sup>0</sup> = 1</code>:
    - This represents the set of morphisms from the initial object to any object
      `a`.
    - By definition of initial object, there is a unique such morphism, so it's
      a singleton set.
    - A singleton set is the terminal object in `Set`, so the identity works in
      `Set`.
    - In Haskell, `0 -> Void`, `1 -> ()`, so we have that the set of functions
      from `Void -> a` is a singleton (`absurd :: Void -> a`).

- <code>1<sup>a</sup></code>:
    - In `Set` - there is a unique morphism from any object `a` to the terminal
      object `1`.  This is just the definition of the terminal object.
    - In Haskell, there is only one function `a -> ()`, namely `unit`.

- <code>a<sup>1</sup> = a</code>:
    - Morphisms from the terminal object can be used to pick elements of `a`.
    - In Haskell the isomorphism is between elements of `a` and functions `() ->
      a`.

- <code>a<sup>b+c</sup> = a<sup>b</sup> x a<sup>c</sup></code>:
    - In Haskell, the funciton from a sum type is equivalent to a pair of
      functions from individual types.
