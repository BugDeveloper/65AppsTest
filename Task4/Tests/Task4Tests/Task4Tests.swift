import XCTest
@testable import Task4Lib

final class Task4Tests: XCTestCase {
    func testEmpty() {
        XCTAssertTrue(!Task4().isValidLogin(""))
    }
    
    func testUsernameEndWithNumbers() {
        XCTAssertTrue(Task4().isValidLogin("PlebDestroyer98"))
    }
    
    func testUsernameStartWithNumbers() {
        XCTAssertTrue(!Task4().isValidLogin("98PlebDestroyer"))
    }
    
    func testUsernameWithDot() {
        XCTAssertTrue(Task4().isValidLogin("Pleb.Destroyer"))
    }
    
    func testUsernameStartWithDot() {
        XCTAssertTrue(!Task4().isValidLogin(".Pleb.Destroyer"))
    }
    
    func testUsernameLessLength() {
        XCTAssertTrue(!Task4().isValidLogin("PD"))
    }
    
    func testUsernameMoreLength() {
        XCTAssertTrue(!Task4().isValidLogin("qwertyuiopasdfghjklzxcvbnmqwertyuio"))
    }
    
    func testEmailUsual() {
        XCTAssertTrue(Task4().isValidLogin("PlebDestroyer@mail.ru"))
    }
    
    
    func testEmailStartWithNumbers() {
        XCTAssertTrue(Task4().isValidLogin("12321PlebDestroyer@mail.ru"))
    }
    
    func testEmailEndWithNumbers() {
        XCTAssertTrue(!Task4().isValidLogin("meh@mail.ru3213"))
    }
    
    func testEmailEndsDOt() {
        XCTAssertTrue(!Task4().isValidLogin("meh@mail."))
    }
    
    static var allTests = [
        ("testEmpty", testEmpty),
        ("testUsernameEndWithNumbers", testUsernameEndWithNumbers),
        ("testUsernameStartWithNumbers", testUsernameStartWithNumbers),
        ("testUsernameWithDot", testUsernameWithDot),
        ("testUsernameStartWithDot", testUsernameStartWithDot),
        ("testUsernameLessLength", testUsernameLessLength),
        ("testUsernameMoreLength", testUsernameMoreLength),
        ("testEmailUsual", testEmailUsual),
        ("testEmailStartWithNumbers", testEmailStartWithNumbers),
        ("testEmailEndWithNumbers", testEmailEndWithNumbers),
        ("testEmailEndsDOt", testEmailEndsDOt),
        ]
}
