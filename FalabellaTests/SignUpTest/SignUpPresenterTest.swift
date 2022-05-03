//
//  SignUpPresenterTest.swift
//  MVPTableTestTests
//
//  Created by Karine Karapetyan on 02-05-22.
//

import XCTest
@testable import Falabella

class MockSignupView: SignUpPresenterDelegate {
    var message: String?
    
    func showSignUpError(errMessage: String) {
        self.message = errMessage
    }
    
    func displayAlert(message: String) {
        self.message = message
    }
    
    
}

class SignUpPresenterTest: XCTestCase {
    
    var view: MockSignupView!
    var presenter: SignUpPresenter!
    var userRegister: UserRegister!
    
    override func setUp()  {
        view = MockSignupView()
        presenter = SignUpPresenter(delegate: view)
       
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
    }
    
    func testShowSignUpError() {
        view.showSignUpError(errMessage: "Sign up failed!")
        XCTAssertEqual(view.message, "Sign up failed!")
    }
    
    func testdisplayAlert() {
        view.displayAlert(message: "Alert display")
        XCTAssertEqual(view.message, "Alert display")
    }
   

}
