import Foundation
import ArgumentParser
import LoremSwiftum

struct Word: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Generates words.")
    @OptionGroup var options: Options

    mutating func run() {
        let result = LoremSwiftum.Lorem.words(options.count)
        print(result)
    }
}
