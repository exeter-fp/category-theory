// Chapter 1 - Categories - The Essence of Composition
// See: https://bartoszmilewski.com/2014/11/04/category-the-essence-of-composition/

import UIKit

// 1 - Implement, as best as you can, the identity function in your favorite
// language (or the second favorite, if your favorite language happens to be Haskell).

// Well, my favourite is Haskell, so here's my (current) second favourite

func id<T>(in a : T) -> T {
    return a
}

id(in: 42)
id(in: 3.1415926)
id(in: "All your base are belong to us")

struct Dummy {
    let i: Int
    let d: Double
    let s: String
}

id(in: Dummy(i: 1, d: 3.14, s: "plugh!"))


// 2 - Implement the composition function in your favorite language. It takes two
// functions as arguments and returns a function that is their composition.

func comp<A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
    return {a in
        g(f(a))
    }
}


// 3 - Write a program that tries to test that your composition function respects
// identity.

func double(x : Int) -> Int {
    return x * 2
}

// This just tests for a specific case
// One of these days, I'll take a look at https://github.com/typelift/SwiftCheck
comp(f: double, g: id)(10) == comp(f: id, g: double)(10)
