//
//  Falabella.swift
//  Falabella
//
//  Created by Karine Karapetyan on 01-05-22.
//

import Foundation
import UIKit

public final class Falabella {

   public init() {
        
    }
    
   public func getCurrentViewController() -> UIViewController? {
       print ("Modul is working")
//       let bundle = Bundle(for: Falabella.self)
//
//
//       let podBundle = Bundle(for:LoginViewController.self)
//           if let bundleURL = podBundle.url(forResource: "Falabella", withExtension: "bundle") {
//               if let bundle = Bundle(url: bundleURL) {
//                   let cellNib = UINib(nibName: Constant.NibNames.login, bundle: bundle)
//
//               } else {
//                   assertionFailure("Could not load the bundle")
//               }
//           } else {
//               assertionFailure("Could not create a path to the bundle")
//           }
       
       
       
       if UserDefaultsManager.shared.isLoggedIn() {
           
           let frameworkBundle = Bundle(for: LoginViewController.self)
           let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Falabella.bundle")
           let resourceBundle = Bundle(url: bundleURL!)
           
          return  LoginViewController(nibName: Constant.NibNames.login, bundle: resourceBundle)
           
       } else {
           let frameworkBundle = Bundle(for: AttributesViewController.self)
           let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Falabella.bundle")
           let resourceBundle = Bundle(url: bundleURL!)
           
          return AttributesViewController(nibName: Constant.NibNames.attributes, bundle: resourceBundle)
       }
    
//       return UserDefaultsManager.shared.isLoggedIn() ? AttributesViewController(nibName: Constant.NibNames.attributes, bundle: bundle) : LoginViewController(nibName: Constant.NibNames.login, bundle: bundle)
       
//       let vc = UIViewController
//       vc = UserDefaultsManager.shared.isLoggedIn() ? AttributesViewController(nibName: Constant.NibNames.attributes, bundle: nil) : LoginViewController(nibName: Constant.NibNames.login, bundle: nil)
//       self.navigationController?.pushViewController(vc, animated: true)

    }
    
}


