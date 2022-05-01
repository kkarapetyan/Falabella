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
    

    func pushViewController(nibName: String) {
        
        let vc = UIViewController(nibName: nibName, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
