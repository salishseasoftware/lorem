import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(loremTests.allTests),
        testCase(EmailAddressTests.allTests),
        testCase(NameTests.allTests),
        testCase(ParagraphTests.allTests),
        testCase(SentenceTests.allTests),
        testCase(TitleTests.allTests),
        testCase(TweetTests.allTests),
        testCase(UrlTests.allTests),
        testCase(WordTests.allTests),
    ]
}
#endif
