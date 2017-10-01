# [Chapter 3 - Categories Great and Small](https://bartoszmilewski.com/2014/12/05/categories-great-and-small/)

## Notes

### No Objects

- Trivial category is one with no objects or morphisms.

- Like an empty set, but for categories.

- Can be important in the context of other categories - e.g. the category of all
  categories.


### Simple Graphs

- Any directed graph can be turned into a _free category_ by:
    - Adding an identity arrow at each node
    - For any two _composable_ arrows, add a new arrow to serve as their
      composition
    - Repeat, adding new arrows as required


### Orders

- A binary relation `≤` on a set `P` is a _preorder_ if `≤` is both _reflexive_
  and _transitive_:
    - _Reflexive_ - `a ≤ a` for all `a` in `P`
    - _Transitive_ - if `a ≤ b` and `b ≤ c` then `a ≤ c` for all `a`, `b`, `c`
      in `P`.

- Equivalently, if the members of `P` are objects in a category `C` and there is a
  morphism between `a` and `b` iff `a ≤ b`, then the reflexivity and
  transitivity properties of `≤` are equivalent to the categorical properties of
  `C`.

- A preorder is a category where there is at most one morphism between any two
  objects `a` and `b` - this is called a _thin category_.

- If, in addition to being a _preorder_, `≤` is _anti-symmetric_ (i.e. `a ≤ b`
  and `b ≤ a` implies `a = b`) then `≤` is said to be a _partial order_.

- Finally, if any two distinct objects `a` and `b` are related by either `a ≤ b`
  or `b ≤ a`, then `≤` is said to be a _total order_.

- A set of morphisms from object `a` to object `b` in a category `C` is called a
  _hom-set_, denoted `C(a, b)` or <code>Hom<sub>C</sub>(a, b)</code>.


## Challenges

