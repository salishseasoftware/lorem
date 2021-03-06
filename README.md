# lorem

A command line lorem impsum generator for Mac OS, because sometimes its just easier to type the command.

This simply wraps the excellent [LoremSwiftum](https://github.com/lukaskubanek/LoremSwiftum) package by [lukaskubanek](https://github.com/lukaskubanek/LoremSwiftum/commits?author=lukaskubanek) in a basic command line tool.

## Requirements

- Swift 4.0+
- Xcode 9.2+
- macOS 10.10+

## Installation

### With [`Mint`](https://github.com/yonaskolb/Mint)

```sh
$ mint install salishseasoftware/lorem
```

### Manually

Clone the repo then:

```
$ make install
```

Or using swift itself:

```
$ swift build -c release
$ cp .build/release/lorem /usr/local/bin/lorem
```

### Xcode

Generate the Xcode project:

```
$ swift package generate-xcodeproj
$ open ./lorem.xcodeproj
```

Build the project, then:

1. Product > Archive
1. Distribute Content
1. Built Products
1. copy the `lorem` executable to `/usr/local/bin/' or wherever you prefer.

## Usage

```
OVERVIEW: A command line lorem ipsum generator.

USAGE: lorem <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  word                    Generates words.
  sentence                Generates sentences.
  paragraph (default)     Generates paragraphs.
  title                   Generates a title.
  name                    Generates a name.
  email-address           Generates an email address.
  url                     Generates a URL.
  tweet                   Generates a tweet.

  See 'lorem help <subcommand>' for detailed help.
```
  
The `word`, `sentence`, and `paragraph` subcommands accept a `--count` option that determines how many of that type are generated.

```
OVERVIEW: Generates words.

USAGE: lorem word [--count <count>]

OPTIONS:
  -c, --count <count>     Number of items to generate. (default: 1)
  -h, --help              Show help information.
```
  
The `name` subcommand accepts a `--portion` option to specify whether to generate a first, last, or full name.

```
OVERVIEW: Generates a name.

USAGE: lorem name [--portion <portion>]

OPTIONS:
  -p, --portion <portion> [first|last|full] (default: first)
  -h, --help              Show help information.
```

The `tweet` subcommand accepts a `--lenth` option to specify whether to generate a short or long tweet.

```
OVERVIEW: Generates a tweet.

USAGE: lorem tweet [--length <length>]

OPTIONS:
  -l, --length <length>   [short|long] (default: short)
  -h, --help              Show help information.
```

## License

[MIT License](LICENSE.md)