//
//  DetailsViewController.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK: -- Outlets
    @IBOutlet weak var mCodeLb: UILabel!
    @IBOutlet weak var mNameLb: UILabel!
    @IBOutlet weak var mUniteMeasureLb: UILabel!
    @IBOutlet weak var mDateLb: UILabel!
    @IBOutlet weak var mContentStackV: UIStackView!
    @IBOutlet weak var mValueLb: UILabel!
    
    lazy var presenter = DetailsPresenter(delegate: self)

    //MARK: -- Life ciyle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        mContentStackV.layer.cornerRadius = 5
    }
   
}


extension DetailsViewController: DetailsPresenterDelegate {
    /// Show details
    func presentDetails(valuta: Valuta) {
        
        DispatchQueue.main.async {
            
            self.mCodeLb?.text = valuta.codigo
            self.mNameLb?.text = "Test"
        }

       
    }
    
    
}
