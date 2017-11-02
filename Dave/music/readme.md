# Music stuff - CT The Beginner’s Introduction

[Source video](https://www.youtube.com/watch?v=P6DvIfTJhx8&app=desktop)

## Music intro

- 12 pitch classes (notes). Mode is a subset of these 12 e.g C major.
- Chromatic scale is all 12 notes.
- Major Cscale is: C, D, E, F, G, A, B
- Black notes have 2 names.  Sometimes have to use certain name.
- Minor C scale is: C, D, E♭, F, G, A♭, B
- | E.... B.... C♯m.... A.... :|

![](pitch-classes.png)


## CT intro

Definition of category:

- 3 Data: What the objects are, the arrows with their domain and co-domain (start and end object).  E.g. for S(Set), objects are abstract sets, arrows are functions, what identity is
- Rules: What the data must follow. 1 - Composition. 2 - Associtive. 3 - Identity composition

- To be a valid category, we must prove our objects and arrows follow these rules
- In S, an arrow must have a single co-domain for any given domain (but not visa-versa).

- Arrows are the core of CT, objects only exist to anchor the arrows.  Err on making more arrows rather than objects.
- Postive features of arrows, rather than what they are not.


## Category Music(S)

Abstract category S of Set, vs Music(S) which is actual notes in sets.

![](music-category.png)

- Two objects, Pitch classes and Pitch-class names, each is a set.  Separate because the same class can have more than 1 name e.g. C#, Dflat
- Map name to class.  7 straight 1-to-1, 5 2-to-1.
Naming: 0-cluster, 1-cluster, etc.
- Add another Set of objects L, letter names of the pitch-class-names,
- Define the ‘maps’ on a single arrow.  Internal map vs External map

When composing a new arrow, be must list the composition, because there could be made arrows A->C

![](composition.png)
![](composition-example.png)

- After composition, clusters can stay same, or increase in size, never reduce
- Commuting diagram: all paths between 2 points are considered the same.
