//
//  AttributeTableViewCell.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import UIKit

class AttributeTableViewCell: UITableViewCell {
    
    static let identifier = "AttributeTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var mNameLb: UILabel!
    @IBOutlet weak var mValueLb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


   //Set cell information
    public func setCellInfo(item: Valuta) {
        self.mNameLb.text = item.nombre
        self.mValueLb.text = "\(item.valor)"
    }
}
