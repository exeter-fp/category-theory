import UIKit

func id<T>(a:T) -> T {
    return a
}

// https://github.com/ijoshsmith/function-composition-in-swift


infix operator --> :AdditionPrecedence

func --> <A, B, C> (
    aToB: @escaping (A) -> B,
    bToC: @escaping (B) -> C)
    -> (A) -> C
{
    return { a in
        let b = aToB(a)
        let c = bToC(b)
        return c
    }
}

func toUpper(string: String) -> String {
    return string.uppercased()
}

let toUpperId = toUpper --> id
toUpperId("hello")

let idToUpper = id --> toUpper
idToUpper("hello again")
