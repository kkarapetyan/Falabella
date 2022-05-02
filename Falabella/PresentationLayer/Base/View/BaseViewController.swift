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
    
    func getBundle(myClass: AnyClass) -> Bundle? {
        
        let frameworkBundle = Bundle(for: myClass.self as! AnyClass)
        let bundleURL =  frameworkBundle.resourceURL?.appendingPathComponent("Falabella.bundle")
        guard let url = bundleURL else { return nil}
        return Bundle(url: url)
    }

}
