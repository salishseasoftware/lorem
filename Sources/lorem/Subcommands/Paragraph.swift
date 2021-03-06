import Foundation
import ArgumentParser
import LoremSwiftum

struct Paragraph: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Generates paragraphs.")
    @OptionGroup var options: Options

    mutating func run() {
        let result = LoremSwiftum.Lorem.paragraphs(options.count)
        print(result)
    }
}
