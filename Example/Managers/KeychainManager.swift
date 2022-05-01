//
//  KeychainManager.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import Foundation
//import KeychainAccess
//
//
//
//final class KeychainManager {
//    
//    let keychain = Keychain(service: "Karine-Karapetyan.MVPTableTest")
//    let email = "Email"
//    let password = "Password"
//    let userName = "UserName"
//
//    
//    // MARK: - Functions
//    
//    /// Save userName in keychain
//    func saveUsername(username: String) {
//        do {
//            try keychain.set(username, key: userName)
//        } catch let error {
//            print(error)
//        }
//    }
//    
//    /// Save password in keychain
//    func savePassword(passw: String) {
//        do {
//            try keychain.set(passw, key: password)
//        } catch let error {
//            print(error)
//        }
//    }
//    
//    /// Save email in keychain
//    func saveEmail(fullName: String) {
//        do {
//            try keychain.set(fullName, key: email)
//        } catch let error {
//            print(error)
//        }
//    }
//    
//     
//    /// Check user token
//    func isUserLoggedIn() -> Bool {
//        return keychain[accessTokenKey] != nil
//    }
//
//    
//    /// Get token from keychain
//    func getUsername() -> String? {
//        let username = try? keychain.getString(userName)
//        return username
//    }
//    
//    /// Get refresh token from keychain
//    func getPasswor() -> String? {
//        let passw = try? keychain.getString(password)
//        return passw
//    }
//    
//    /// Get full name of user from keychain
//    func getUserFullName() -> String? {
//        let fullName = try? keychain.getString(userFullName)
//        return fullName
//    }
//    
//   
//    /// Delete token from keychain
//    func removeData() {
//        do {
//            try keychain.removeAll()
//        } catch let error {
//            debugPrint("Error: \(error)")
//        }
//    }
//    
//    /// Remove all keychain data when run first time
//    func resetIfNeed() {
//        if !UserDefaults.standard.bool(forKey: "hasRunBefore") {
//            // Remove Keychain items here
//            do {
//                try keychain.removeAll()
//            } catch let error {
//                debugPrint("Error: \(error)")
//            }
//            
//            // Update the flag indicator
//            UserDefaults.standard.set(true, forKey: "hasRunBefore")
//        }
//    }
//    
//}
