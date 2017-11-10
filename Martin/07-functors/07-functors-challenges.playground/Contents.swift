import UIKit

func comp<A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
    return {a in
        g(f(a))
    }
}

class Reader<R, A> {
    let g: (R) -> A
    
    init(g: @escaping (R) -> A) {
        self.g = g
    }
    
    func apply(r: R) -> A {
        return g(r)
    }

    func fmap<B>(f: @escaping (A) -> B) -> Reader<R, B> {
        return Reader<R, B>{ r in
            f(self.g(r))
        }
    }
}



let incReader = Reader<Int, Int>(g: { $0 + 1 })
incReader.apply(r: 5)

let double : (Int) -> Int = { $0 * 2 }

let incThenDoubleReader = incReader.fmap(f: double)
incThenDoubleReader.apply(r: 5)
