# [Chapter 5 - Products & Coproducts](https://bartoszmilewski.com/2015/01/07/products-and-coproducts)

## Notes

### Initial Object

- In a category, `a` is considered 'more initial' than `b` if there is a
  morphism from `a` to `b`, i.e. `∃ m ∈ Hom(a, b)`.

- The _initial object_ (if it exists) is the object that has *one and only one*
  morphism going to any object in the category.

- If it exists, the initial object is unique (up to isomorphism).

- Examples:
    - In a poset, the least element of the set (according to the poset's
      underlying order relation)
    - In `Set`, the initial object is `∅`, corrsponding to the Haskell type
      `Void`, because `absurb :: Void -> a` is the single morphism from `Void`
      to any type `a`.



## Challenges

1. _Show that the terminal object is unique up to unique isomorphism._

2. _What is a product of two objects in a poset? Hint: Use the universal
   construction._

3. _What is a coproduct of two objects in a poset?_

4. _Implement the equivalent of Haskell `Either` as a generic type in your
   favorite language (other than Haskell)._

5. _Show that `Either` is a “better” coproduct than `int` equipped with two injections:_
    ```
    int i(int n) { return n; }
    int j(bool b) { return b? 0: 1; }
    ```

   _Hint: Define a function:_

   ```
   int m(Either const & e);
   ```

   _that factorizes i and j._

6. _Continuing the previous problem: How would you argue that `int` with the two
   injections `i` and `j` cannot be “better” than `Either`?_



7. _Still continuing: What about these injections?_

    ```
    int i(int n) { 
      if (n < 0) return n;
      return n + 2;
    }

    int j(bool b) { return b? 0: 1; }
    ```

8. _Come up with an inferior candidate for a coproduct of `int` and `bool` that
   cannot be better than `Either` because it allows multiple acceptable
   morphisms from it to `Either`._


