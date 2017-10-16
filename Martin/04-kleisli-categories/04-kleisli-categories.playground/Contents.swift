import UIKit

var logger = ""

// Impure version of 'negate and log' just mutates global state
func negateAndLog(b: Bool) -> Bool {
    logger += "Not so! "
    return !b
}

negateAndLog(b: true)
negateAndLog(b: false)

// After two calls, `logger` has been mutated
logger


// Pure version that takes in the log and returns it
func pureNegateAndLog(b: Bool, logger: String) -> (Bool, String) {
    return (!b, logger + "Not so! ")
}

pureNegateAndLog(b: false, logger: "The log so far...")


// Pure version that just returns the log meesage - log composition happens between the calls
func nicerPureNegateAndLog(b: Bool) -> (Bool, String) {
    return (!b, "Not so! ")
}



// A structure that represents a value, together with a log message
struct Writer<T> {
    var t : T
    var log: String
}


// Simple functions that also return a log message
func toUpper(s: String) -> Writer<String> {
    return Writer(t: s.uppercased(), log: "uppercased() ")
}

func toWords(s: String) -> Writer<[String]> {
    return Writer(t: s.components(separatedBy: " "), log: "words() ")
}


// This is how we compose the specific functions above, to include log concatenation
func process(s: String) -> Writer<[String]> {
    let p1 = toUpper(s: s)
    let p2 = toWords(s: p1.t)
    return Writer(t: p2.t, log: p1.log + p2.log)
}

process(s: "the quick brown fox")


// The general composition function for Writer<T>
func comp<A, B, C>(f: @escaping (A) -> Writer<B>,
                   g: @escaping (B) -> Writer<C>)
    -> ((A) -> Writer<C>) {
        return {a in
            let b = f(a).t
            return Writer(t: g(b).t, log: f(a).log + g(b).log)
        }
}

let upperWords = comp(f: toUpper, g: toWords)
upperWords("the quick brown fox")


// The identity for Writer<T>
func id<A>(a: A) -> Writer<A> {
    return Writer(t: a, log: "")
}
