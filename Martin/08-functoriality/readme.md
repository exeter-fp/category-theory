# [Chapter 8 - Functoriality](https://bartoszmilewski.com/2015/02/03/functoriality)

## Notes




## Challenges

1. _Show that the data type:_

    ```haskell
    data Pair a b = Pair a b
    ```

   _is a bifunctor. For additional credit implement all three methods of
   Bifunctor and use equational reasoning to show that these definitions are
   compatible with the default implementations whenever they can be applied._


2. _Show the isomorphism between the standard definition of `Maybe` and this
   desugaring:_

    ```haskell
    type Maybe' a = Either (Const () a) (Identity a)
    ```

   _Hint: Define two mappings between the two implementations. For additional
   credit, show that they are the inverse of each other using equational
   reasoning._


3. _Let’s try another data structure. I call it a `PreList` because it’s a
   precursor to a `List`.  It replaces recursion with a type parameter `b`:_

    ```haskell
    data PreList a b = Nil | Cons a b
    ```

   _You could recover our earlier definition of a `List` by recursively applying
   `PreList` to itself (we’ll see how it’s done when we talk about fixed
   points)._

   _Show that `PreList` is an instance of `Bifunctor`._


4. _Show that the following data types define bifunctors in `a` and `b`:_

    ```haskell
    data K2 c a b = K2 c
    data Fst a b = Fst a
    data Snd a b = Snd b
    ```

   _For additional credit, check your solutions agains Conor McBride’s paper
   [Clowns to the Left of me, Jokers to the
   Right](http://strictlypositive.org/CJ.pdf)_.


5. _Define a bifunctor in a language other than Haskell. Implement bimap for a
   generic pair in that language._


6. _Should `std::map` be considered a bifunctor or a profunctor in the two
   template arguments `Key` and `T`? How would you redesign this data type to
   make it so?_

