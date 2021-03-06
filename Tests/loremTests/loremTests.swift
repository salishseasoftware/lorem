import XCTest

final class LoremTests: XCTestCase {

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

    static var allTests = [
        ("testDefaultArgs", testDefaultArgs),
    ]
}
