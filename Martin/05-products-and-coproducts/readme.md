# [Chapter 5 - Products & Coproducts](https://bartoszmilewski.com/2015/01/07/products-and-coproducts)

## Notes


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


