# [Chapter 4 - Kleisli Categories](https://bartoszmilewski.com/2014/12/23/kleisli-categories)

## Notes

### Composition of Logs

- In a traditional imperative language, we'd implement logging by mutating some
  global state:
    ```swift
    var logger = ""

    func negateAndLog(b: Bool) -> Bool {
        logger += "Not so! ";
        return !b;
    }
    ```

- `negate` clearly isn't pure:
    - its memoised version would fail to produce a log, for example.

- However, we can make it pure by passing in and returning the log:
    ```swift
    func pureNegateAndLog(b: Bool, logger: String) -> (Bool, String) {
        return (!b, logger + "Not so! ")
    }
    ```

- This has various disadvantages:
    - It can't easily be memoised, because of the `logger` parameter
    - It's not a great library function, as callers need to pass in the string
    - The two concerns (negation and composing the logs) are not clearly
      separated.

- Next try - get the function to return the log string, but aggregate the logs
  _between_ function calls:
    ```swift
    func nicerPureNegateAndLog(b: Bool) -> (Bool, String) {
        return (!b, "Not so! ")
    }
    ```


### String manipulation with log composition

- Let's say we have two functions that convert and tokenise strings:
    ```swift
    func toUpper(s: String) -> String {
        return s.uppercased()
    }

    func toWords(s: String) -> [String] {
        return s.components(separatedBy: " ")
    }
    ```

- Say we want each of these to return a log message - we'll get them to return a
  struct (which we'll call `Writer<A>`) which is like the tuple we returned
  before:
    ```swift
    struct Writer<T> {
        var t: T
        var log: String
    }

    func toUpper(s: String) -> Writer<String> {
        return Writer(t: s.uppercased(), log: "uppercased() ")
    }

    func toWords(s: String) -> Writer<[String]> {
        return Writer(t: s.components(separatedBy: " "), log: "words() ")
    }
    ```

- Now, to compose both functions, we can do:
    ```swift
    func process(s: String) -> Writer<[String]> {
        let p1 = toUpper(s: s)
        let p2 = toWords(s: p1.a)
        return Writer(a: p2.a, log: p1.log + p2.log)
    }
    ```


### The `Writer` Category

- In the above, we've left types as objects, but now our morphisms are the
  'embellished' functions `A -> Writer<B>`:
    - In the category, this is still considered to be a morphism between `A` and
      `B`.

- We can't compose `f :: a -> Writer b` with `g :: b -> Writer c`, in the
  'naive' way, since the input and output types don't match.

- Instead we define composition in this category as:
    1. Get `f(a)`
    2. Extract the 'value' component of `f(a)` as `b`, and pass it to `g`
    3. Concatenate the log component of `f(a)` to the log component of `g(b)`
    4. Return the 'value' component of `g(b)` with the combined log

- To express this programatically, for composing any two functions that return a
  `Writer<T>`:
    ```swift
    func comp<A, B, C>(f: @escaping (A) -> Writer<B>,
                       g: @escaping (B) -> Writer<C>)
                   -> ((A) -> Writer<C>) {
        return {a in
            let b = f(a).t
            return Writer(t: g(b).t, log: f(a).log + g(b).log)
        }
    }

    > let upperWords = comp(f: toUpper, g: toWords)
    > upperWords("the quick brown fox")
    ```

- We've defined composition in this new category, but not identity, but that's
  easy:
    ```swift
    func id<A>(a: A) -> Writer<A> {
        return Writer(t: a, log: "")
    }
    ```


### The `Writer` category in Haskell

- See [Writer.hs](Writer.hs) for an example of this in Haskell


### Kleisli Categories

- What we've described above is an example of a [Kleisli Category](https://en.wikipedia.org/wiki/Kleisli_category) - a category based on a monad (here the `Writer` monad).

- The objects in the Kleisli category are the same as the objects in the underlying type system.

- Morphisms between objects `A` and `B` in the Kleisli category are functions that go from type `A` to a type 'derived from' type `B`
    - i.e. to an 'embellished' type such as `Writer<B>`
    - The category defines how this composition works (e.g. by appending logs)



## Challenges

A function that is not defined for all possible values of its argument is
called a partial function. It’s not really a function in the mathematical
sense, so it doesn’t fit the standard categorical mold. It can, however, be
represented by a function that returns an embellished type `optional`:

```cpp
template<class A> class optional {
    bool _isValid;
    A    _value;
public:
    optional()    : _isValid(false) {}
    optional(A v) : _isValid(true), _value(v) {}
    bool isValid() const { return _isValid; }
    A value() const { return _value; }
};
```

As an example, here’s the implementation of the embellished function `safe_root`:

```cpp
optional<double> safe_root(double x) {
    if (x >= 0) return optional<double>{sqrt(x)};
    else return optional<double>{};
}
```

Here’s the challenge:

1. _Construct the Kleisli category for partial functions (define composition and identity)._

2. _Implement the embellished function `safe_reciprocal` that returns a valid reciprocal of its argument, if it’s different from zero._

3. _Compose `safe_root` and `safe_reciprocal` to implement `safe_root_reciprocal` that calculates `sqrt(1/x)` whenever possible._
