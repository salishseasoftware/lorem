import Foundation
import ArgumentParser
import LoremSwiftum

struct URL: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Generates a URL.")

    mutating func run() {
        let result = LoremSwiftum.Lorem.url
        print(result)
    }
}
