//
//  NewSpellViewController.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit
import MultiSelectSegmentedControl

class NewSpellViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var levelSegment: UISegmentedControl!
    @IBOutlet weak var componentSegment: MultiSelectSegmentedControl!
    @IBOutlet weak var schoolPicker: UIPickerView!
    
    var selectedComponents = ""
    var schoolOfMagic = ""
    var level = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentSegment.delegate = self
        schoolPicker.delegate = self
        schoolPicker.dataSource = self
    }

    @IBAction func CreateSpell(_ sender: Any)
    {
        guard nameTextField.text != "" else {return}
        guard selectedComponents != "" else {return}
        level = levelSegment.selectedSegmentIndex
        print(nameTextField.text!)
        print(selectedComponents)
        print(schoolOfMagic)
        print(level)
        
        
        let spell = Spell()
        spell.name = nameTextField.text!
        spell.level = level
        spell.components = selectedComponents
        spell.school = schoolOfMagic
        
        RealmManager.instance.saveSpell(spell: spell)
        showToast(message: "Spell Added")
        _ = navigationController?.popViewController(animated: true)
        
    }
}




extension NewSpellViewController: UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SchoolEnum(rawValue: row)?.description
    }
}

extension NewSpellViewController: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SchoolEnum.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        schoolOfMagic =  (SchoolEnum(rawValue: row)?.description)!
    }
}

extension NewSpellViewController: MultiSelectSegmentedControlDelegate
{
    func multiSelect(_ multiSelecSegmendedControl: MultiSelectSegmentedControl!, didChangeValue value: Bool, at index: UInt) {
        for segment in multiSelecSegmendedControl.selectedSegmentTitles as! [String]
        {
            selectedComponents = "\(selectedComponents) \(segment)"
        }
        
    }
}
