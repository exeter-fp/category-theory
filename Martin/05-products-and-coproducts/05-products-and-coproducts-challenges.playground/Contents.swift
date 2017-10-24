// 05-products-and-coproducts - Challenges

import UIKit

// Challenge 4 - Implement the equivalent of Haskell Either as a
// generic type in your favorite language (other than Haskell).

enum Either<A, B> {
    case Left(A)
    case Right(B)
}

func factorizer<A, B, C>(_ f: (A) -> C, _ g: (B) -> C, _ e: Either<A, B>) -> C {
    switch e {
    case .Left(let a):
            return f(a)
    case .Right(let b):
        return g(b)
    }
}


func length(_ s: String) -> Int {
    return s.lengthOfBytes(using: .utf8)
}

func double(_ i: Int) -> Int {
    return i * 2
}

let e1 : Either<String, Int> = .Left("hello")
let e2 : Either<String, Int> = .Right(42)
factorizer(length, double, e1)
factorizer(length, double, e2)
