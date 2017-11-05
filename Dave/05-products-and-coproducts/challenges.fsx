
// 4 - Either type

type Either<'a,'b> = Left of 'a | Right of 'b

// 5 - factorise both functions

let i (n:int) = n

let j = function
    | true -> 0
    | false -> 1

let m = function
    | Left x -> x
    | Right true  -> 0
    | Right false -> 1

// Confirm i = Left >> m
let i' = Left >> m
let j' = Right >> m


// 6 - how can we show i and j are not better than Either

// Cannot factoroise m in terms of i or j

// 7 - are these better than Either

let i = function
    | x when x < 0 -> x
    | y            -> y + 2

let j = function
    | true  -> 0
    | false -> 1

let m = function
    | 0 -> Right true
    | 1 -> Right false
    | x when x < 0 -> Left x
    | x -> Left <| x - 2

// 8 ??