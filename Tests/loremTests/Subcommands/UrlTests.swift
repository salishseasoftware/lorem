import XCTest

class UrlTests: XCTestCase {

    func testUrl() throws {
        let result = runProcess(args: "url")

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

    static var allTests = [
        ("testUrl", testUrl),
    ]
}
