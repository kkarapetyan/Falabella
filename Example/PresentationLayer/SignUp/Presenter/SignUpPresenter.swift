//
//  SignUpPresenter.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import Foundation

protocol SignUpPresenterDelegate: AnyObject {
    func showSignUpError(errMessage: String)
    func displayAlert(message: String)

    
}

class SignUpPresenter {
    
    lazy var validator = Validator()
    weak var delegate: SignUpPresenterDelegate?
    var user: User?
    var errMessage: String?
    
    //MARK -- init
    init(delegate: SignUpPresenterDelegate) {
        self.delegate = delegate
    }
    
    ///Did tap sign up button
    public func didTapSignUp(name: String?,
                             email: String?,
                             password: String?,
                             confirmPassword: String?) {
        errMessage = nil
        let userRegister = UserRegister(name: name,
                                        email: email,
                                        password: password,
                                        confirmPassword: confirmPassword)
        if !validator.isFillFields(name: name,
                                  email: email,
                                  password: password,
                                  confirmPassword: confirmPassword) {
            
            errMessage = Constant.Strings.fillFileds
            
        } else if !validator.isValidEmail(email ?? "") {
            
            errMessage = Constant.Strings.invalidEmail
        } else if !validator.isCorrectConfirmPassword(password: password!, confirmPassword: confirmPassword!) {
            errMessage = Constant.Strings.confirmPass
        }
        
        guard let err = errMessage else {
            
            signUp(name: name!, email: email!, password: password!)
            return
        }
        // show sign up error message
        delegate?.showSignUpError(errMessage: err)
    }
    
    
    ///creat account in data base
    func signUp(name: String,
                email: String,
                password: String) {
       
        let pass = try! password.aesEncrypt()
       // let dec = try! enc.aesDecrypt()
//        print(password) 
//        print("enc:\(enc)") // 2r0+KirTTegQfF4wI8rws0LuV8h82rHyyYz7xBpXIpM=
//        print("dec:\(dec)") // string to encrypt
//        print("\(password == dec)") // true
        
//        1111567
//        enc:CA6ALpfksP2U/e/ZDuQTgg==
//        dec:1111567
        
        
        CoreDataManager.shared.creatUserdetails(name: name, email: email, password: pass) { [unowned self] status in
            
            switch status {
            case .success:
                self.delegate?.displayAlert(message: Constant.Strings.registerSccessful)
            case .failed(let error):
                // show sign up error message
                self.delegate?.showSignUpError(errMessage: error)
            }
        }
        
    }
}
