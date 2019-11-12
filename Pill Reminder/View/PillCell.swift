//
//  PillCell.swift
//  Pill Reminder
//
//  Created by armin on 11/12/19.
//  Copyright © 2019 shalchian. All rights reserved.
//

import UIKit

class PillCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var date: UILabel!
    
    let capsuleImages = [#imageLiteral(resourceName: "ic_capsule_pink"), #imageLiteral(resourceName: "ic_capsule_blue"), #imageLiteral(resourceName: "ic_capsule_green"), #imageLiteral(resourceName: "ic_capsule_orange"), #imageLiteral(resourceName: "ic_capsule_red"), #imageLiteral(resourceName: "ic_capsule_purple"), #imageLiteral(resourceName: "ic_capsule_yellow"), #imageLiteral(resourceName: "ic_capsule_white")]
    let tabletImages  = [#imageLiteral(resourceName: "ic_tablet_pink"), #imageLiteral(resourceName: "ic_tablet_blue"), #imageLiteral(resourceName: "ic_tablet_green"), #imageLiteral(resourceName: "ic_tablet_orange"), #imageLiteral(resourceName: "ic_tablet_red"), #imageLiteral(resourceName: "ic_tablet_purple"), #imageLiteral(resourceName: "ic_tablet_yellow"), #imageLiteral(resourceName: "ic_tablet_white")]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI (items : Pill) {
        title.text = items.name
        date.text = items.reminder?.toString(dateFormat: "YYYY/MM/dd HH:mm")
        count.text = String(Int(items.count))
        
        switch items.color {
        case "pink":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[0]
            } else {
                typeImage.image = tabletImages[0]
            }
            break
            
        case "blue":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[1]
            } else {
                typeImage.image = tabletImages[1]
            }
            break
            
        case "green":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[2]
            } else {
                typeImage.image = tabletImages[2]
            }
            break
            
        case "orange":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[3]
            } else {
                typeImage.image = tabletImages[3]
            }
            break
            
        case "red":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[4]
            } else {
                typeImage.image = tabletImages[4]
            }
            break
            
        case "purple":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[5]
            } else {
                typeImage.image = tabletImages[5]
            }
            break
            
        case "yellow":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[6]
            } else {
                typeImage.image = tabletImages[6]
            }
            break
            
        case "white":
            if (items.type == "capsule") {
                typeImage.image = capsuleImages[7]
            } else {
                typeImage.image = tabletImages[7]
            }
            break
        default:
            break
        }
        
    }

}
