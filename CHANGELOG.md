# Change Log

## 2.0.1

- Renamed `MandatoryLiteral` enum in `DecodingError` to `MandatoryKeyNotFound` for clarity

## 2.0.0

- API now uses a functional approach.
- `JSONDecoder` class and its associated methods have been replaced by an `extension` on `Dictionary`. The JSON key is now decoded by calling the `jsonKey(_:)` function. e.g.:

```swift
let jsonDictionary = [
  "key": "value",
  "key2": "value2"
]

let myStringValue : String? = jsonDictionary.jsonKey("key")
print(myStringValue) // "Optional("value")\n"
```