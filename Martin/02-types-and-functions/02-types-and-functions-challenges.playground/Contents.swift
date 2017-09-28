// Chapter 2 - Types and Functions
// See: https://bartoszmilewski.com/2014/11/24/types-and-functions/

import UIKit

/*
 Challenge 1

 Define a higher-order function (or a function object) memoize in your
 favorite language. This function takes a pure function f as an argument
 and returns a function that behaves almost exactly like f, except that
 it only calls the original function once for every argument, stores the
 result internally, and subsequently returns this stored result every time
 it’s called with the same argument. You can tell the memoized function
 from the original by watching its performance. For instance, try to memoize
 a function that takes a long time to evaluate. You’ll have to wait for the
 result the first time you call it, but on subsequent calls, with the same
 argument, you should get the result immediately.
*/

print ("Challenge 1")
print ("===========")
print ()

func memoize<A : Hashable, B>(f: @escaping (A) -> B) -> (A) -> B {

    var cache = Dictionary<A, B>()
    
    return { (a : A) -> B in
        if let b = cache[a] {
            print ("Cache hit for a = \(a), returning \(b)")
            return b
        } else {
            print ("Cache miss for a = \(a), calling function")
            let b = f(a)
            cache[a] = b
            print ("Returning \(b)")
            return b
        }
    }
}

func sleepyIncrement(a : Int) -> Int {
    print ("Function called with a = \(a)")
    print ("Sleeping for 1 second")
    Thread.sleep(forTimeInterval: 1)
    print ("Waking")
    return a + 1
}

let memoSleepyIncrement = memoize(f: sleepyIncrement)

print("First call to memoSleepyIncrement(1)")
memoSleepyIncrement(1)

print()
print("Second call to memoSleepyIncrement(1)")
memoSleepyIncrement(1)



/*
 Challenge 2
 
 Try to memoize a function from your standard library that you normally
 use to produce random numbers. Does it work?
*/

print ()
print ("Challenge 2")
print ("===========")
print ()

// Can't memoise the basic `arc4random` function because it doesn't take
// parameters, so this is a type error
//let memoArc4Random = memoize(f: arc4random)

// If we use `arc4random_uniform(upperBound)` it's possible to memoise
let memoisedArc4RandomUniform = memoize(f: arc4random_uniform)

// But it just returns the same number over and over again, obviously
memoisedArc4RandomUniform(100)
memoisedArc4RandomUniform(100)
memoisedArc4RandomUniform(100)


/*
 Challenge 3
 
 Most random number generators can be initialized with a seed. Implement
 a function that takes a seed, calls the random number generator with
 that seed, and returns the result. Memoize that function. Does it work?
*/

print ()
print ("Challenge 3")
print ("===========")
print ()

func callGenerator(withSeed seed: Int) -> Double {
    print ("In callGenerator(\(seed))")
    srand48(seed)
    return drand48()
}

let memoisedCallGenerator = memoize(f: callGenerator)
memoisedCallGenerator(42)
memoisedCallGenerator(42)
memoisedCallGenerator(666)


/*
 Challenge 5
 
 How many different functions are there from Bool to Bool? Can you
 implement them all?
*/

func alwaysTrue(_: Bool) -> Bool {
    return true
}

func alwaysFalse(_: Bool) -> Bool {
    return false
}

func same(x: Bool) -> Bool {
    return x
}

func not(x: Bool) -> Bool {
    return not(x: x)
}
