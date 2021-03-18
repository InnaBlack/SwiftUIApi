import XCTest
@testable import CoreRealm

final class CoreRealmTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CoreRealm().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
