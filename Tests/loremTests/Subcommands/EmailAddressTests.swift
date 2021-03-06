import XCTest

class EmailAddressTests: XCTestCase {

    func testEmailAddress() throws {
        let result = runProcess(args: "email-address")

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

    static var allTests = [
        ("testEmailAddress", testEmailAddress),
    ]
}
