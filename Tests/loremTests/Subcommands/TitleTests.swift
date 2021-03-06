import XCTest

class TitleTests: XCTestCase {

    func testTitle() throws {
        let result = runProcess(args: "title")

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

    static var allTests = [
        ("testTitle", testTitle),
    ]
}
