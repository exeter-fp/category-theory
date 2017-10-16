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





## Challenges

A function that is not defined for all possible values of its argument is
called a partial function. It’s not really a function in the mathematical
sense, so it doesn’t fit the standard categorical mold. It can, however, be
represented by a function that returns an embellished type optional:

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

