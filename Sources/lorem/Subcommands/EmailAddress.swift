import Foundation
import ArgumentParser
import LoremSwiftum

struct EmailAddress: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Generates an email address.")

    mutating func run() {
        let result = LoremSwiftum.Lorem.emailAddress
        print(result)
    }
}
