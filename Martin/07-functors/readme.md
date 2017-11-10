# [Chapter 7 - Functor](https://bartoszmilewski.com/2015/01/20/functors)

## Notes

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

