# [Chapter 1 - Category : The Essence of Composition](https://bartoszmilewski.com/2014/11/04/category-the-essence-of-composition)

## Notes

- A _category_ consists of objects and arrows (_morphisms_) that go between
  them.

- Given two morphisms `f` and `g`, their composition is written `g . f`

- In pseudo-Haskell notation:

```haskell
f :: A -> B
g :: B -> C

f . g :: A -> C
```

- A category has the following properties:
    - If there is a morphism `f` from object `A -> B` and a morphism `g` from `B
      -> C`, then there is also a morphism `g .f` from `A to C`
    - Composition is associative : `f . (g . h) = (f . g) . h`
    - For any object `A` there is an identity morphism `idA` such that `f . idA
      = idA . f = f`


## Challenges

1. See [01-challenges.playground](01-challenges.playground/Contents.swift)

2. See [01-challenges.playground](01-challenges.playground/Contents.swift)

3. See [01-challenges.playground](01-challenges.playground/Contents.swift)

4. _Is the world-wide web a category in any sense? Are links morphisms?_

It's tempting to count web pages as objects and links from that page as
morphisms, but this doesn't form a category since:

a) Not every page necessarily has a link to itself (which would be the identity
morphism for that object).
b) The existence of a link from page `A` to page `B`, and a link from page `B`
to page `C` doesn't imply that there's necessarily a link from page `A` to page
`C`.

5. Is Facebook a category, with people as objects and friendships as morphisms?

No, for reasons similar to the above - friendships aren't necessarily
composable, nor is a person a friend with themselves.

6. When is a directed graph a category?

When every node in the graph has an edge to itself and, whenever there are edges
`E1(V1, V2)` and `E2(V2, V3)` there is also an edge `E3(V1,V3)`.