import Foundation
import ArgumentParser
import LoremSwiftum

struct Title: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Generates a title.")

    mutating func run() {
        let result = LoremSwiftum.Lorem.title
        print(result)
    }
}
