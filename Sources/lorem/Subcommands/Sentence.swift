import Foundation
import ArgumentParser
import LoremSwiftum

struct Sentence: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Generates sentences.")
    @OptionGroup var options: Options

    mutating func run() {
        let result = LoremSwiftum.Lorem.sentences(options.count)
        print(result)
    }
}
