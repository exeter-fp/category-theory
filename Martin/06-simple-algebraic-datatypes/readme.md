# [Chapter 6 - Simple Algebraic Datatypes](https://bartoszmilewski.com/2015/01/13/simple-algebraic-data-types)

## Notes

### Product Types

- Canonical product type in Haskell is a pair:
    ```haskell
    data (,) a b = (,) a b
    ```

- Pairs aren't strictly commutative, but are commutative up to isomorphism, the
  relevant isomorphism being `swap`:
    ```haskell
    swap :: (a, b) -> (b, a)
    swap (x, y) = (y, x)
    ```

- Nested pairs are isomorphic to tuples - `(a, (b, c))` is isomorphic to `(a, b,
  c)`

- The unit type `()` is the unit of the product in the same way that 1 is the
  unit of multiplication, since `(a, ())` is isomorphic to `a`:
    ```haskell
    rho :: (a, () -> a
    rho (x, ()) = x

    rho_inv :: a -> (a, ())
    rho_inv x = (x, ())
    ```

- This means that `Set` is a _monoidal category_ - i.e. it's a category that's
  also a monoid.

- The more general way of defining a product type in Haskell is:
    ```haskell
    data Pair a b = P a b
    ```

- Alternatively, we can use _records_ in Haskell, which give us named fields,
  together with function accessors:
    ```haskell
    data Element = Element { name         :: String
                           , symbol       :: String
                           , atomicNumber :: Int }
    ```


### Sum Types

- The canonical implementation of the sum type in Haskell is:
    ```haskell
    data Either a b = Left a | Right b
    ```

- Like pairs. `Either`s are commutative up to isomorphism and can be nested:
    ```haskell
    data OneOfThree a b c = Sinistral a | Medial b | Dextral c
    ```

- `Set` is also a monoidal category with respect to coproduct, with the initial
  object (`Void`) as the unit element:
  - So, `Either a Void` is isomorphic to `a`, since it's not possible to
    construct a `Right` instance containing a value of type `Void`


### Algebra of Types

- We have seen the following analogies between types and integers:
    - Sum types with `Void` <=> integers under addition with unit 0
    - Product types with `()` <=> integers under multiplication with unit 1

- What does multiplication by zero look like in this analogy?
    - Product of type `a` and `Void` needs a value of both types
    - We can't provide a value of `Void`
    - So the only possible inhabitant of the product is `Void`
    - In other words `(a, Void)` is isomorphic to `Void`
    - This is analogous to `a * 0 = 0`

- What about the distributive property - `a * (b + c) = a * b + a * c`?
    - The left hand side corresponds to `(a, Either b c)`
    - The right hand side corresponds to `Either (a, b) (a, c)`
    - See [SADTs.hs](SADTs.hs) for implementations of the isomorphism

- Here's a translation table showing the correspondence between numbers and
  types:

    | Numbers   | Types                                           |
    | --------- | ----------------------------------------------- |
    | 0         | `Void`                                          |
    | 1         | `()`                                            |
    | a + b     | <code>Either a b = Left a &#124; Right b</code> |
    | a * b     | `(a, b)` or `Pair a b = Pair a b`               |
    | 2 = 1 + 1 | <code>data Bool = True &#124; False</code>      |
    | 1 + a     | <code>data Maybe = Nothing &#124; Just a</code> |

- Consider the definition of the `List` type:
    ```haskell
    List a = Nil | Cons a (List a)
    ```

- Doing the usual substitutions, and writing `x` for `List a`, we get `x = 1 +
  a*x`, which expands out as:

    ```
    x = 1 + a*x
    x = 1 + a * (1 + a*x) = 1 + a + a*a*x
    x = 1 + a + a*a*(1 + a*x) = 1 + a + a*a + a*a*x
    ...
    x = 1 + a + a*a + a*a*a + a*a*a*a + ...
    ```



## Challenges

1. _Show the isomorphism between `Maybe a` and `Either () a`_

    See [Challenges06.hs](Challenges06.hs)


2. _Here’s a sum type defined in Haskell:_

    ```haskell
    data Shape = Circle Float
               | Rect Float Float
    ```

    _When we want to define a function like area that acts on a `Shape`, we do it
    by pattern matching on the two constructors:_

    ```haskell
    area :: Shape -> Float
    area (Circle r) = pi * r * r
    area (Rect d h) = d * h
    ```

    _Implement `Shape` in C++ or Java as an interface and create two classes:
    `Circle` and `Rect`.  Implement `area` as a virtual function._

    See [challenge06-2-4](challenge06-2-4)


3. _Continuing with the previous example: We can easily add a new function
   `circ` that calculates the circumference of a `Shape`. We can do it without
   touching the definition of `Shape`:_

    ```haskell
    circ :: Shape -> Float
    circ (Circle r) = 2.0 * pi * r
    circ (Rect d h) = 2.0 * (d + h)
    ```

    _Add `circ` to your C++ or Java implementation.  What parts of the original
    code did you have to touch?_

    See [challenge06-2-4](challenge06-2-4).  We needed to update the `Shape`
    interface to add the new function, and each of the two implementations.


4. _Continuing further: Add a new shape, `Square`, to `Shape` and make all the
   necessary updates.  What code did you have to touch in Haskell vs. C++ or
   Java? (Even if you’re not a Haskell programmer, the modifications should be
   pretty obvious.)_

    See [challenge06-2-4](challenge06-2-4) for the various updates.  In Java we
    had to add a new implementation class `Square` (I chose to add a new
    implementation, rather than extend `Rect`).  In Haskell we had to edit the
    type definition of `Shape` and the implementations of both `area` and `circ`
    functions.

5. _Show that `a + a = 2 * a` holds for types (up to isomorphism).  Remember
   that 2 corresponds to `Bool`, according to our translation table._

    See [Challenges06.hs](Challenges06.hs) for the isomorphism between `Either a
    a` and `Pair Bool a`
