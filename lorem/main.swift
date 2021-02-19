import Foundation
import ArgumentParser
import LoremSwiftum

struct Lorem: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A command line lorem ipsum generator.",
        subcommands: [
            Word.self,
            Sentence.self,
            Paragraph.self,
            Title.self,
            Name.self,
            EmailAddress.self,
            URL.self,
            Tweet.self
        ],
        defaultSubcommand: Paragraph.self)
}

struct Options: ParsableArguments {
    @Option(name: .shortAndLong, help: "Number of items to generate.")
    var count: Int = 1
}

extension Lorem {
    struct Word: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Generates words.")
        @OptionGroup var options: Options

        mutating func run() {
            let result = LoremSwiftum.Lorem.words(options.count)
            print(result)
        }
    }

    struct Sentence: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Generates sentences.")
        @OptionGroup var options: Options

        mutating func run() {
            let result = LoremSwiftum.Lorem.sentences(options.count)
            print(result)
        }
    }

    struct Paragraph: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Generates paragraphs.")
        @OptionGroup var options: Options

        mutating func run() {
            let result = LoremSwiftum.Lorem.paragraphs(options.count)
            print(result)
        }
    }

    struct Title: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Generates a title.")

        mutating func run() {
            let result = LoremSwiftum.Lorem.title
            print(result)
        }
    }

    struct Name: ParsableCommand {
        enum Portion: String, CaseIterable, ExpressibleByArgument {
            case first, last, full
        }

        static var configuration = CommandConfiguration(abstract: "Generates a name.")

        @Option(name: .shortAndLong, help: "[first|last|full]")
        var portion: Portion = .first

        mutating func run() {
            switch portion {
            case .first:
                print(LoremSwiftum.Lorem.firstName)
            case .last:
                print(LoremSwiftum.Lorem.lastName)
            case .full:
                print(LoremSwiftum.Lorem.fullName)
            }
        }
    }

    struct EmailAddress: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Generates an email address.")

        mutating func run() {
            let result = LoremSwiftum.Lorem.emailAddress
            print(result)
        }
    }

    struct URL: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Generates a URL.")

        mutating func run() {
            let result = LoremSwiftum.Lorem.url
            print(result)
        }
    }

    struct Tweet: ParsableCommand {
        enum Length: String, CaseIterable, ExpressibleByArgument {
            case short, long
        }
        
        static var configuration = CommandConfiguration(abstract: "Generates a tweet.")

        @Option(name: .shortAndLong, help: "[short|long]")
        var length: Length = .short

        mutating func run() {
            switch length {
            case .short:
                print(LoremSwiftum.Lorem.shortTweet)
            case .long:
                print(LoremSwiftum.Lorem.tweet)
            }
        }
    }
}

Lorem.main()
