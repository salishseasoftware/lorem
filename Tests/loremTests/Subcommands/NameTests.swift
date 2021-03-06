import XCTest

class NameTests: XCTestCase {

    func testName() throws {
        let result = runProcess(args: "name")

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
        let result = runProcess(args: "name", "--portion", "first")

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
        let result = runProcess(args: "name", "--portion", "last")

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
        let result = runProcess(args: "name", "--portion", "full")

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

    static var allTests = [
        ("testFirstName", testFirstName),
        ("testLastName", testLastName),
        ("testFullName", testFullName),
    ]
}
