# [Chapter 7 - Functor](https://bartoszmilewski.com/2015/01/20/functors)

## Notes

- A _functor_ is a mapping between categories - given two categories `C` and `D`
  a functor `F` maps:
    - Objects in `C` to objects in `D`
    - Morphisms between objects in `C` to morphisms between objects in `D`

- Functors preserve connections, so if `f :: a -> b` is a morphism in `C`, then
  `F f :: F a -> F b` is the corresponding morphism in `D`.

![Functor Definition](images/functor-definition.jpg)

- Also, if `h = g . f`, we want its image under `F` to be a composition of the
  images of `f` and `g` - i.e. `F h = F g . F f`

![Functor Composition](images/functor-composition.jpg)

- Finally, identity morphisms in `C` are mapped to identity morphisms in `D` -
  i.e. <code>F id<sub>a</sub> = id<sub>F a</sub></code>:

![Functor Identity](images/functor-identity.jpg)


## Functors in Programming

- In our category of types and functions, we can talk about functors that map
  this category to itself - these are called _endofunctors_

- For example, `Maybe` is a mapping from `a -> Maybe a`, where
    ```haskell
    data Maybe a = Nothing | Just a
    ```

- Given a function `f :: a -> b`, we can make the _lifted_ function `f' :: Maybe a
  -> Maybe b` as follows:
    ```haskell
    f' :: Maybe a -> Maybe b
    f' Nothing  = Nothing
    f' (Just x) = Just (f x)
    ```

- The transformation of `f` into `f'` is defined by a _higher-order function_
  `fmap :: (a -> b) -> (Maybe a -> Maybe b)`, defined as:
    ```haskell
    fmap :: a -> b -> Maybe a -> Maybe b
    fmap _ Nothing  = Nothing
    fmap f (Just x) = Just (f x)
    ```

- It's pretty straightforward to show that `fmap` satisfies the necessary laws
  to ensure that `Maybe` is a functor:
    ```haskell
    fmap id = id
    fmap (g.f) = fmap g . fmap f
    ```

- Haskell abstracts this into the `Functor` _typeclass_:
    ```haskell
    class Functor f where
        fmap :: (a -> b) -> f a -> f b

    -- This implements an instance of `Functor` for `Maybe`
    instance Functor Maybe wehere
        fmap _ Nothing  = Nothing
        fmap f (Just x) = Just (f x)
    ```


## The `List` Functor

- We can define the list datatype in Haskell as:
    ```haskell
    data List a = Nil | Cons a (List a)
    ```

- Then we can define that `List` is a `Functor` using the following recursive
  definition:
    ```haskell
    instance Functor List where
        fmap _ Nil        = Nil
        fmap f (Cons x t) = Cons (f x) (fmap f t)
    ```


## The `Reader` Functor

- `Functor` aren't just 'containers' like `Maybe` and `List`.  Consider the
  `Reader` functor `(->) r`, which represents a partially-applied function.

- To show that `(->) r` is a functor, we need to be able to take a function `f
  :: a -> b` and lift it into a function `(r -> a) -> (r -> b)`:
    ```haskell
    fmap :: (a -> b) -> (r -> a) -> (r -> b)
    -- Simple composition works just fine here!
    fmap f g = f . g
    ```


## `Functor` Composition

- Functors between categories compose in the obvious ways.

- It's particularly easy to compose _endofunctors_ because the source and
  destination categories are the same, e.g.:
    ```haskell
    maybeTail :: [a] -> Maybe [a]
    maybeTail []     = Nothing
    maybeTail (x:xs) = Just xs
    ```



## Challenges

1. _Can we turn the Maybe type constructor into a functor by defining:_

    ```haskell
    fmap _ _ = Nothing
    ```

   _which ignores both of its arguments? (Hint: Check the functor laws.)_

2. _Prove functor laws for the reader functor. Hint: it’s really simple._

3. _Implement the reader functor in your second favorite language (the first
   being Haskell, of course)._


4. _Prove the functor laws for the list functor. Assume that the laws are true
   for the tail part of the list you’re applying it to (in other words, use
   induction)._

