module Shape where

data Shape
    = Circle Float
    | Rect Float
           Float
    | Square Float

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rect d h) = d * h
area (Square l) = l * l

circ :: Shape -> Float
circ (Circle r) = 2.0 * pi * r
circ (Rect d h) = 2.0 * (d + h)
circ (Square l) = 4 * l