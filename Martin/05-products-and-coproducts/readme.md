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
      underlying order relation).
    - In `Set`, the initial object is `∅`, corrsponding to the Haskell type
      `Void`, because `absurb :: Void -> a` is the unique morphism from `Void`
      to any type `a`.


### Terminal Object

- Conversely to the discussion above, `a` is considered 'more terminal' than `b`
  if there is a morphism from `b` to `a`, ie. `∃ m ∈ Hom(b, a)`.

- The _terminal object_ (if it exists) is the object that has *one and only one*
  morphism coming from any object in the category.

- Like the initial object, if the terminal object exists, it is unique up to
  isomorphism.

- Examples:
    - In a poset, the greatest element of the set.
    - In `Set`, the terminal object is the singleton set, corresponding to the
      Haskell type `()`, because `unit :: a -> ()` is the unique morphism from
      any type `a` to `()`.


### Duality

- For any category `C`, the 'opposite category', <code>C<sup>op</sup></code> is
  the category formed by reversing the direction of all the morphisms in `C`.

- Composition in <code>C<sup>op</sup></code> is defined by:
    - If `f::a->b` and `g::b->c` compose to `h::a->c` with `h=g.f`
    - Then <code>f<sup>op</sup>::b->a</code> and
      <code>g<sup>op</sup>::c->b</code> will compose to
      <code>h<sup>op</sup>::c->a</code> with
      <code>h<sup>op</sup>=f<sup>op</sup>.g<sup>op</sup></code>

- Reversing identity arrows is just a no-op.

- Constructions in <code>C<sup>op</sup></code> are prefixed with 'co' and are
  said to be the 'dual' of their constructions in `C`.

- The terminal object in `C` is the initial object in
  <code>C<sup>op</sup></code>.


### Isomorphism

- Objects `a` and `b` are said to be _isomorphic_ if there exist morphisms
  `f::a->b` and `g::b->a` such that <code>f.g = id<sub>b</sub></code> and
  <code>g.f = id<sub>a</sub></code>

- Proof that the intiial object is unique up to isomorphism:
    - Suppose there are two initial objects `i1` and `i2`
    - Since `i1` is initial, ∃ unique `f::i1->i2`
    - Since `i2` is initial, ∃ unique `g::i2->i1`
    - Composing these, `g.f :: i1 -> i1`
    - But, since `i1` is initial, there is only one morphism from `i1->i1`,
      namely <code>id<sub>i1</sub></code>
    - Therefore <code>g.f = id<sub>i1</sub></code>
    - A similar argument proves that <code>f.g = id<sub>i2</sub></code>
    - Therefore `i1` and `i2` are isomorphic

- The dual argument holds for terminal objects (see challenge 1 below).


## Challenges

1. _Show that the terminal object is unique up to unique isomorphism._

    Cheat mode: By duality.

    The full proof:
    - Suppose there are two terminal objects `t1` and `t2`
    - Since `t1` is terminal, ∃ unique `f::t2->t1`
    - Since `t2` is terminal, ∃ unique `g::t1->t2`
    - Composing these, `f.g :: t1 -> t1`
    - But, since `t1` is terminal, there is only one morphism from `t1->t1`,
      namely <code>id<sub>t1</sub></code>
    - Therefore <code>f.g = id<sub>t1</sub></code>
    - A similar argument proves that <code>g.f = id<sub>t2</sub></code>
    - Therefore `t1` and `t2` are isomorphic

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


