import XCTest

class TweetTests: XCTestCase {

    func testTweet() throws {
        let result = runProcess(args: "tweet")

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
        let result = runProcess(args: "tweet", "--length", "short")

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
        let result = runProcess(args: "tweet", "--length", "long")

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

    static var allTests = [
        ("testTweet", testTweet),
        ("testShortTweet", testShortTweet),
        ("testLongTweet", testLongTweet),
    ]
}
