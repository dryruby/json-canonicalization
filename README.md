# json-canonicalization
An implementation of the JSON Canonicalization Scheme for Ruby

Implements version 5 of [draft-rundgren-json-canonicalization-scheme-05](https://tools.ietf.org/html/draft-rundgren-json-canonicalization-scheme-05#page-5).

[![Gem Version](https://badge.fury.io/rb/json-canonicalization.png)](http://badge.fury.io/rb/json-canonicalization)
[![Build Status](https://github.com/dryruby/json-canonicalization/workflows/CI/badge.svg?branch=develop)](https://github.com/dryruby/json-canonicalization/actions?query=workflow%3ACI)
[![Coverage Status](https://coveralls.io/repos/dryruby/json-canonicalization/badge.svg)](https://coveralls.io/r/dryruby/json-canonicalization)

# Description

Cryptographic operations like hashing and signing depend on that the target 
data does not change during serialization, transport, or parsing. 
By applying the rules defined by JCS (JSON Canonicalization Scheme), 
data provided in the JSON [[RFC8259](https://tools.ietf.org/html/rfc8259)]
format can be exchanged "as is", while still being subject to secure cryptographic operations.
JCS achieves this by building on the serialization formats for JSON
primitives as defined by ECMAScript [[ES6](https://www.ecma-international.org/ecma-262/6.0/index.html)],
constraining JSON data to the<br>I-JSON [[RFC7493](https://tools.ietf.org/html//rfc7493)] subset,
and through a platform independent property sorting scheme.

Working document: https://cyberphone.github.io/ietf-json-canon<br>
Published IETF Draft: https://tools.ietf.org/html/draft-rundgren-json-canonicalization-scheme-16

The JSON Canonicalization Scheme concept in a nutshell:
- Serialization of primitive JSON data types using methods compatible with ECMAScript's `JSON.stringify()`
- Lexicographic sorting of JSON `Object` properties in a *recursive* process
- JSON `Array` data is also subject to canonicalization, *but element order remains untouched*

### Sample Input:
```code
{
  "numbers": [333333333.33333329, 1E30, 4.50,
              2e-3, 0.000000000000000000000000001],
  "string": "\u20ac$\u000F\u000aA'\u0042\u0022\u005c\\\"\/",
  "literals": [null, true, false]
}
```
### Expected Output:
```code
{"literals":[null,true,false],"numbers":[333333333.3333333,1e+30,4.5,0.002,1e-27],"string":"€$\u000f\nA'B\"\\\\\"/"}
```
## Usage
The library accepts Ruby input and generates canonical JSON via the `#to_json_c14n` method. This is based on the standard JSON gem's version of `#to_json` with overloads for `Hash`, `String` and `Numeric`

```ruby
data = {
  "numbers" => [
    333333333.3333333,
    1.0e+30,
    4.5,
    0.002,
    1.0e-27
  ],
  "string" => "€$\u000F\nA'B\"\\\\\"/",
  "literals" => [nil, true, false]
}

puts data.to_json_c14n
=> 
```

## Documentation
Full documentation available on [RubyDoc](http://rubydoc.info/gems/json-canonicalization/file/README.md)

### Principal Classes
* {JSON::Canonicalization}

## Dependencies
* [Ruby](http://ruby-lang.org/) (>= 2.6)
* [JSON](https://rubygems.org/gems/json) (>= 2.6)

## Author
* [Gregg Kellogg](http://github.com/gkellogg) - <http://kellogg-assoc.com/>

## Contributing
* Do your best to adhere to the existing coding conventions and idioms.
* Don't use hard tabs, and don't leave trailing whitespace on any line.
* Do document every method you add using [YARD][] annotations. Read the
  [tutorial][YARD-GS] or just look at the existing code for examples.
* Don't touch the `json-ld.gemspec`, `VERSION` or `AUTHORS` files. If you need to
  change them, do so on your private branch only.
* Do feel free to add yourself to the `CREDITS` file and the corresponding
  list in the the `README`. Alphabetical order applies.
* Do note that in order for us to merge any non-trivial changes (as a rule
  of thumb, additions larger than about 15 lines of code), we need an
  explicit [public domain dedication][PDD] on record from you,
  which you will be asked to agree to on the first commit to a repo within the organization.

## License

This is free and unencumbered public domain software. For more information,
see <https://unlicense.org/> or the accompanying {file:UNLICENSE} file.

[YARD]:           https://yardoc.org/
[YARD-GS]:        https://rubydoc.info/docs/yard/file/docs/GettingStarted.md
[PDD]:            https://unlicense.org/#unlicensing-contributions
