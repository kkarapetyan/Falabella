//
//  BaseViewController.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getBundleURL(myClass: AnyClass) -> URL? {
        let frameworkBundle = Bundle(for: myClass.self as! AnyClass)
        return frameworkBundle.resourceURL?.appendingPathComponent("Falabella.bundle")
    }

}
