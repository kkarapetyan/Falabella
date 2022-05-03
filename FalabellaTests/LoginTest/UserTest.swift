//
//  UserTest.swift
//  MVPTableTestTests
//
//  Created by Karine Karapetyan on 02-05-22.
//

import XCTest
@testable import Falabella

class UserTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testUserModel() {
        let user = User(name: "Test name", email: "Test email", password: "Test password")
        XCTAssertEqual(user.name, "Test name")
        XCTAssertEqual(user.email, "Test email")
        XCTAssertEqual(user.password, "Test password")

    }

}
