//
//  LoginResenterTest.swift
//  MVPTableTestTests
//
//  Created by Karine Karapetyan on 02-05-22.
//

import XCTest
@testable import Falabella

class MockView: LoginPresenterDelegate {
    var errMessage: String?
    var isShowSignUp: Bool = false
    var isShowAttributes: Bool = false
    
    func showSignUp() {
        self.isShowSignUp = true
    }
    
    func showLoginError(errMessage: String) {
        self.errMessage = errMessage
    }
    
    func showAttributes() {
        self.isShowAttributes = true
    }
    
    
}

class LoginpesenterTest: XCTestCase {

    var view: MockView!
    var user: User!
    var presenter: LoginPresenter!
    
    override func setUp() {
        view = MockView()
        user = User(name: "Test name", email: "Test email", password: "Test password")
        presenter = LoginPresenter(delegate: view)
    }
    
    override func tearDown() {
        view = nil
        user = nil
        presenter = nil
    }
    
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "View is not nil")
    }
    
    func testSignUp() {
        view.showSignUp()
        let isShowSignUp = view.isShowSignUp
        XCTAssertTrue(isShowSignUp, "showSignUp called")
    }
    
    func testLoginError() {
        view.showLoginError(errMessage: "Login has a error")
        XCTAssertEqual(view.errMessage, "Login has a error")
    }
    
    func testShowAttributes() {
        view.showAttributes()
        XCTAssertTrue(view.isShowAttributes, "showSAttributes called")
    }
    
    func testUserModel() {
        XCTAssertEqual(user.name, "Test name")
        XCTAssertEqual(user.email, "Test email")
        XCTAssertEqual(user.password, "Test password")

    }

}
