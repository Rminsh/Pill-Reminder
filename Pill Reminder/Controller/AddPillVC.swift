//
//  AddPillVC.swift
//  Pill Reminder
//
//  Created by armin on 11/12/19.
//  Copyright © 2019 shalchian. All rights reserved.
//

import UIKit

class AddPillVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let colors = [#imageLiteral(resourceName: "ic_pink"), #imageLiteral(resourceName: "ic_blue"), #imageLiteral(resourceName: "ic_green"), #imageLiteral(resourceName: "ic_orange"), #imageLiteral(resourceName: "ic_red"), #imageLiteral(resourceName: "ic_purple"), #imageLiteral(resourceName: "ic_yellow"), #imageLiteral(resourceName: "ic_white")]
    var selectedColor : String = "blue"
    
    @IBOutlet weak var colorCollection: UICollectionView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var pillSegmentedControl: UISegmentedControl!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.colorCollection.selectItem(at: NSIndexPath(item: 1, section: 0) as IndexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "color_cell", for: indexPath) as! ColorCell
        let _items = colors [indexPath.row]
        cell.updateUI(image: _items)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let currentCell = collectionView.cellForItem(at: indexPath) as? ColorCell {
            currentCell.setSelected()
            switch(indexPath.row) {
            case 0:
                selectedColor = "pink"
                break
            case 1:
                selectedColor = "blue"
                break
            case 2:
                selectedColor = "green"
                break
            case 3:
                selectedColor = "orange"
                break
            case 4:
                selectedColor = "red"
                break
            case 5:
                selectedColor = "purple"
                break
            case 6:
                selectedColor = "yellow"
                break
            case 7:
                selectedColor = "white"
                break
            default:
                selectedColor = "blue"
                break
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let currentCell = collectionView.cellForItem(at: indexPath) as? ColorCell {
            currentCell.deselected()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        counter.text = Int(sender.value).description
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if (!nameField.text!.isEmpty) {
            self.save { (complete) in
                if complete {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "reloadTable"), object: nil)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let pill = Pill(context: managedContext)
        pill.id = UUID.init()
        pill.name = nameField.text!
        
        switch pillSegmentedControl.selectedSegmentIndex {
        case 0:
            pill.type = "capsule"
        case 1:
            pill.type = "tablet"
        default:
            pill.type = "capsule"
        }
        
        pill.count = countStepper.value
        pill.reminder = datePicker.date
        pill.color = selectedColor
        
        do {
            try managedContext.save()
            completion(true)
            
        } catch {
            debugPrint("🔴Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
