import Foundation
import ArgumentParser
import LoremSwiftum

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
