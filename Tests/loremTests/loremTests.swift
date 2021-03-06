import XCTest
import LibStringy
import class Foundation.Bundle


final class LoremTests: XCTestCase {

    let  procName = "lorem"

    override func setUpWithError() throws {
        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            return
        }
    }

    func testDefaultArgs() throws {
        let result = runProcess()

        switch result {
        case .success(let output):
            let paragraphs = output.paragraphs()
            XCTAssertEqual(1, paragraphs.count)

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Word

    func testWord() throws {
        let result = runProcess(args: ["word"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            let words = output.words()
            XCTAssertEqual(1, words.count)

            words.forEach { XCTAssertFalse($0.isEmpty) }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testWordCount() throws {
        let result = runProcess(args: ["word", "--count", "3"])

        switch result {
        case .success(let output):
            let words = output.words()
            XCTAssertEqual(3, words.count)

            words.forEach { XCTAssertFalse($0.isEmpty) }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Sentence

    func testSentence() throws {
        let result = runProcess(args: ["sentence"])

        switch result {
        case .success(let output):
            let sentences = output.sentences()
            XCTAssertEqual(1, sentences.count)

            sentences.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.words().count > 1)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testSentenceCount() throws {
        let result = runProcess(args: ["sentence", "--count", "3"])

        switch result {
        case .success(let output):
            let sentences = output.sentences()
            XCTAssertEqual(3, sentences.count)

            sentences.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.words().count > 1)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Paragraph

    func testParagraph() throws {
        let result = runProcess(args: ["paragraph"])

        switch result {
        case .success(let output):
            let paragraphs = output.paragraphs()
            XCTAssertEqual(1, paragraphs.count)

            paragraphs.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.sentences().count > 1)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testParagraphCount() throws {
        let result = runProcess(args: ["paragraph", "--count", "3"])

        switch result {
        case .success(let output):
            let paragraphs = output.paragraphs()
            XCTAssertEqual(3, paragraphs.count)

            paragraphs.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.sentences().count > 1)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Title

    func testTitle() throws {
        let result = runProcess(args: ["title"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            let words = output.words()
            XCTAssertTrue(words.count > 1)

            words.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.isCapitalized)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Name

    func testName() throws {
        let result = runProcess(args: ["name"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            let words = output.words()
            XCTAssertEqual(1, words.count)

            words.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.isCapitalized)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testFirstName() throws {
        let result = runProcess(args: ["name", "--portion", "first"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            let words = output.words()
            XCTAssertEqual(1, words.count)

            words.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.isCapitalized)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testLastName() throws {
        let result = runProcess(args: ["name", "--portion", "last"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            let words = output.words()
            XCTAssertEqual(1, words.count)

            words.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.isCapitalized)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testFullName() throws {
        let result = runProcess(args: ["name", "--portion", "full"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            let words = output.words()
            XCTAssertEqual(2, words.count)

            words.forEach {
                XCTAssertFalse($0.isEmpty)
                XCTAssertTrue($0.isCapitalized)
            }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }


    // MARK: - URL

    func testUrl() throws {
        let result = runProcess(args: ["url"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            let urls = output.components(separatedBy: .whitespaces)
            XCTAssertEqual(1, urls.count)

            urls.forEach { XCTAssertTrue($0.isWebUrl) }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Email Address

    func testEmailAddress() throws {
        let result = runProcess(args: ["email-address"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)

            // should have one email address
            let emails = output.components(separatedBy: .whitespaces)
            XCTAssertEqual(1, emails.count)

            emails.forEach { XCTAssertTrue($0.isEmailAddress) }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Tweet

    func testTweet() throws {
        let result = runProcess(args: ["tweet"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)
            XCTAssertLessThan(output.count, 140)

            let words = output.words()
            XCTAssertTrue(words.count >= 1)

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testShortTweet() throws {
        let result = runProcess(args: ["tweet", "--length", "short"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)
            XCTAssertLessThan(output.count, 140)

            let words = output.words()
            XCTAssertTrue(words.count >= 1)

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func testLongTweet() throws {
        let result = runProcess(args: ["tweet", "--length", "long"])

        switch result {
        case .success(let output):
            XCTAssertFalse(output.isEmpty)
            XCTAssertLessThan(output.count, 280)

            let words = output.words()
            XCTAssertTrue(words.count >= 1)

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }


    // MARK: - Helpers

    private func runProcess(args: [String] = []) -> Result<String, Error> {
        let bin = productsDirectory.appendingPathComponent(procName)
        let process = Process()
        process.executableURL = bin

        process.arguments = args

        let stdout = Pipe()
        process.standardOutput = stdout

        let stderr = Pipe()
        process.standardError = stderr

        do {
            try process.run()
            process.waitUntilExit()

            let data = stdout.fileHandleForReading.readDataToEndOfFile()

            let errData = stderr.fileHandleForReading.readDataToEndOfFile()

            if let errMssg = String(data: errData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) {
                guard errMssg.isEmpty else { throw(errMssg) }
            }

            guard let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                throw("Output is nil")
            }

            return .success(output)

        } catch {
            return .failure(error)
        }
    }


    /// Returns path to the built products directory.
    private var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testDefaultArgs", testDefaultArgs),
        ("testWord", testWord),
        ("testWordCount", testWordCount),
        ("testSentence", testSentence),
        ("testSentenceCount", testSentenceCount),
        ("testParagraph", testParagraph),
        ("testParagraphCount", testParagraphCount),
        ("testTitle", testTitle),
        ("testFirstName", testFirstName),
        ("testLastName", testLastName),
        ("testFullName", testFullName),
        ("testEmailAddress", testEmailAddress),
        ("testUrl", testEmailAddress),
        ("testTweet", testTweet),
        ("testShortTweet", testShortTweet),
        ("testLongTweet", testLongTweet),
    ]
}

//extension String: Error, LocalizedError {
//    public var errorDescription: String? { return self }
//}
