import XCTest

class SentenceTests: XCTestCase {

    func testSentence() throws {
        let result = runProcess(args: "sentence")

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
        let result = runProcess(args: "sentence", "--count", "3")

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

    static var allTests = [
        ("testSentence", testSentence),
        ("testSentenceCount", testSentenceCount),
    ]
}
