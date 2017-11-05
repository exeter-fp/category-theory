
// 1 - Morphishm between Maybe a and Either () a

type Either<'a,'b> = Left of 'a | Right of 'b

let maybeToChoice = function
    | None -> Left ()
    | Some x -> Right x

let choiceToMaybe = function
    | Left () -> None
    | Right x  -> Some x

// 2 - Shape as interface, 2 implementations

type IShape =
    abstract Area: unit -> float
    abstract Circumference: unit -> float

type Circle(radius) =
    interface IShape with
        member x.Area() = System.Math.PI * (radius * radius)
        member x.Circumference() = System.Math.PI * 2.0 * radius

type Rectangle(width,height) =
    interface IShape with
        member x.Area() = width * height
        member x.Circumference() = width * 2. + height * 2.


 // 3 - Need to touch interface and both object definitions

 // 4 - Haskell needs a new pattern per method, OO needs new object with 2 new implementations

 type Sqaure(width) =
    interface IShape with
        member x.Area() = width * width
        member x.Circumference() = width * 4.

// 5 -   a + a = 2 * a

type left<'a> = L of 'a | R of 'a
type right<'a> = bool * 'a

let lToR = function
    | L x -> (true,x)
    | R x -> (false,x)

let rToL = function
    | true, x -> L x
    | false, x -> R x