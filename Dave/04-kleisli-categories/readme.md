# Kleisli Categories

- Category of normal types, but functions are embelished e.g. Writer category
- Embelished function returning complex type, but still considered a morphism between e.g. int -> bool
- This gives us something else to play with (rules of composition)
- Adding effects to pure functions
- Compostion like ROP, need to change types to fit
- CT: composition ? monoid around the extra info (any monoid category will work)
- CT: identity ? For log writer that would be id,""
- Fish operator, '>=>', function composition with 'extra' step
