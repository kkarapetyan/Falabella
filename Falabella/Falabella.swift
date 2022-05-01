//
//  Falabella.swift
//  Falabella
//
//  Created by Karine Karapetyan on 01-05-22.
//

import Foundation

public final class Falabella {
    
    var window: UIWindow?
    var initialViewController: UIViewController?
    var navController: UINavigationController?

   public init() {
        
    }
    
   public func openModule() {
        
        window = UIWindow(frame:UIScreen.main.bounds)
        initialViewController = UserDefaultsManager.shared.isLoggedIn() ? AttributesViewController(nibName: Constant.NibNames.attributes, bundle: nil) : LoginViewController(nibName: Constant.NibNames.login, bundle: nil)
        navController = UINavigationController(rootViewController: initialViewController!)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
}


