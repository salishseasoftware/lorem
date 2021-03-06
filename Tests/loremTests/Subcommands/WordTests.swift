import XCTest

class WordTests: XCTestCase {

    func testWord() throws {
        let result = runProcess(args: "word")

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
        let result = runProcess(args: "word", "--count", "3")

        switch result {
        case .success(let output):
            let words = output.words()
            XCTAssertEqual(3, words.count)

            words.forEach { XCTAssertFalse($0.isEmpty) }

        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    static var allTests = [
        ("testWord", testWord),
        ("testWordCount", testWordCount),
    ]
}
