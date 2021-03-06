import XCTest

class ParagraphTests: XCTestCase {

    func testParagraph() throws {
        let result = runProcess(args: "paragraph")

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
        let result = runProcess(args: "paragraph", "--count", "3")

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

    static var allTests = [
        ("testParagraph", testParagraph),
        ("testParagraphCount", testParagraphCount),
    ]
}
