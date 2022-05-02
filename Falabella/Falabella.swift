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
    
   public func getCurrentViewController() -> UIViewController {
       print ("Modul is working")
       return UserDefaultsManager.shared.isLoggedIn() ? AttributesViewController(nibName: Constant.NibNames.attributes, bundle: nil) : LoginViewController(nibName: Constant.NibNames.login, bundle: nil)
       
//       let vc = UIViewController
//       vc = UserDefaultsManager.shared.isLoggedIn() ? AttributesViewController(nibName: Constant.NibNames.attributes, bundle: nil) : LoginViewController(nibName: Constant.NibNames.login, bundle: nil)
//       self.navigationController?.pushViewController(vc, animated: true)

    }
    
}


