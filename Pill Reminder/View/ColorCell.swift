//
//  ColorCell.swift
//  Pill Reminder
//
//  Created by armin on 11/12/19.
//  Copyright © 2019 shalchian. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    
    func updateUI (image : UIImage) {
        itemImage.image = image
    }
    
    override var isSelected: Bool {
        didSet {
            itemImage.layer.borderWidth = 4
            itemImage.layer.cornerRadius = 20
            itemImage.layer.borderColor = #colorLiteral(red: 0.1428291767, green: 0.2725373255, blue: 0.7308433219, alpha: 1)
        }
    }
    
    func setSelected () {
        itemImage.layer.borderWidth = 4
        itemImage.layer.cornerRadius = 20
        itemImage.layer.borderColor = #colorLiteral(red: 0.1428291767, green: 0.2725373255, blue: 0.7308433219, alpha: 1)
    }
    
    func deselected () {
        itemImage.layer.borderWidth = 0
        itemImage.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
}
