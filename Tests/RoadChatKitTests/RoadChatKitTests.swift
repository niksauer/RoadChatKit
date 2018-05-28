import XCTest
@testable import RoadChatKit

final class RoadChatKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RoadChatKit().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
