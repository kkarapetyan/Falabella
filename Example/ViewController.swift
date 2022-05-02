//
//  ViewController.swift
//  Example
//
//  Created by Karine Karapetyan on 02-05-22.
//

import UIKit
import Falabella

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func openModule(_ sender: UIButton) {
         let fal = Falabella()
        let vc = fal.getCurrentViewController()
        guard let vc = vc else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

