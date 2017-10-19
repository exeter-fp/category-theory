import UIKit

// We can use enums with associated values to implement Optional
enum Optional<T> {
    case Nothing
    case Just(T)
}


func safeRoot(_ x: Double) -> Optional<Double> {
    if (x < 0) {
        return .Nothing
    } else {
        return .Just(sqrt(x))
    }
}

safeRoot(4)
safeRoot(-1)


// Challenge 1 - Construct the Kleisli category for partial functions
func comp<A, B, C>(f: @escaping (A) -> Optional<B>,
                   g: @escaping (B) -> Optional<C>)
    -> ((A) -> Optional<C>) {
    return {a in
        switch f(a) {
        case .Nothing:
            return .Nothing
        case .Just(let b):
            switch g(b) {
            case .Nothing:
                return .Nothing
            case .Just(let c):
                return .Just(c)
            }
        }
    }
}

func id<A>(a: A) -> Optional<A> {
    return .Just(a)
}


// Challenge 2 - Implement the embellished function `safeReciprocal`

func safeReciprocal(_ x: Double) -> Optional<Double> {
    if x == 0 {
        return .Nothing
    } else {
        return .Just(1 / x)
    }
}

safeReciprocal(0)
safeReciprocal(2)


// Challenge 3 - Compose `safeRoot` and `safeReciprocal` to implement
// safeRootReciprocal that calculates sqrt(1/x) whenever possible
let safeRootReciprocal = comp(f: safeReciprocal, g: safeRoot)

safeRootReciprocal(0)
safeRootReciprocal(0.25)
safeRootReciprocal(-1)
