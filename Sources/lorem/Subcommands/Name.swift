import Foundation
import ArgumentParser
import LoremSwiftum

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
