# Natural transformations

Functors can be though of as embedding one category in another, the source categorying being a blue print.
Natural transformations and mappings between functors, comparing the embedding process, in the same category.
Called natural because are using morphisms (not adding new structure).

A natural transformation is a selction of morphisms, for every object a, it picks on morphism from Fa to Ga.
We call the natrual transformation α, then αa is the component of it on a:
`αa :: F a -> G a`

![](2_natcomp.jpg)

If there exists an a where we don't have a component, there can be no α.
Functors also map the morphisms so. Mapping is fixed so F f must map to G f, which greatly restricts possible α.

So if in C we have morphism `f between a -> b`, and we have two functors, so `F a -> F b`, and `G a -> G b`.  The natural transform means we have 2 new morphisms `F a -> G a` and `F b -> G b`

![](3_naturality.jpg)

To confirm they are the same, we impost naturality condition that holds for any f:
`G f ∘ αa = αb ∘ F f`

The naturality condition is a pretty stringent requirement. For instance, if the morphism F f is invertible, naturality determines αb in terms of αa. It transports αa along f: `αb = (G f) ∘ αa ∘ (F f)^-1`

Viewing the 'end' of the last diagram, visually:

![](4_transport.jpg)

Existance of natural transforms between 2 functors is far from guarenteed, and tells
you a lot about the structure of a category.

You can say a α:

- Maps objects to morphisms
- Maps morphisms to commuting squares:

![](naturality.jpg)

A **Natural isomorphism** is defines as a α whose compoents are all isomorphisms (invertible morphisms), making 2 functors isomorphic.

## Polymorphic functions

A α in programming means given a type a, an F a, an G a, we can map F a to G a, for all values of a, where F and G are functors. In CT: `G f ∘ αa = αb ∘ F f`

So a natural transformation is a repackaging from one container to another.
The naturality condition means doesn't matter wether we fmap, and then repackage, or
repackage and then fmap, it's the same, they are ortogonal: One moves the eggs, the 
other boils them.

```haskell
-- Polymorphic: works for any a
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

-- Verify naturality condition
fmap f . safeHead = safeHead . fmap f
-- usual equatorial reasoning ...
```

If one of the functors is the Const functor, then the natural transform is just
a function polymorphic in argument or return (depending on NT direction)

```haskell
-- length can be though of as a natural transform between list and const int functors
length :: [a] -> Const Int a
length [] = Const 0
length (x:xs) = Const (1 + unConst (length xs))
      
-- Here, unConst is used to peel off the Const constructor:
unConst :: Const c a -> c
unConst (Const x) = x


-- The other way is harder
scam :: Const Int a -> Maybe a
scam (Const x)      -> Nothing
```
The functor `Reader ()` takes any type a and maps it into a function type `()->a`.
This just chooses a single element from a, so there are a versions of it.

So a NT between reading() and maybe there are only two:

```haskell
alpha :: Reader () a -> Maybe a
      
-- There are only two of these, dumb and obvious:
dumb (Reader _) = Nothing      
obvious (Reader g) = Just (g ())   -- g applies to the unit value, all we can do
```

