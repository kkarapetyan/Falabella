//
//  UserRegisterTest.swift
//  MVPTableTestTests
//
//  Created by Karine Karapetyan on 02-05-22.
//

import XCTest
@testable import Falabella


class UserRegisterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserRegister() {
        let userRegister = UserRegister(name: "Test name",
                                        email: "Test email",
                                        password: "Test pass",
                                        confirmPassword: "Test comfirm pass")
        XCTAssertEqual(userRegister.name, "Test name")
        XCTAssertEqual(userRegister.email, "Test email")
        XCTAssertEqual(userRegister.password, "Test pass")
        XCTAssertEqual(userRegister.confirmPassword, "Test comfirm pass")

    }

}
