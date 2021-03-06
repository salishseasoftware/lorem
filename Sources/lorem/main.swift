import Foundation
import ArgumentParser

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
        defaultSubcommand: Paragraph.self
    )
}

struct Options: ParsableArguments {
    @Option(name: .shortAndLong, help: "Number of items to generate.")
    var count: Int = 1
}

Lorem.main()
