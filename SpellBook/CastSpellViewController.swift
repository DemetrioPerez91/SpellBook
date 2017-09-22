//
//  CastSpellViewController.swift
//  Spellbook
//
//  Created by User on 9/2/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class CastSpellViewController: UIViewController {
    @IBOutlet weak var SPELLvIEW: UIView!

    var spell:Spell?
    var defaultColor:UIColor?
    @IBOutlet var gestureRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultColor = SPELLvIEW.backgroundColor
        gestureRecognizer.direction = .up
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func castSpell()
    {
        if let sp = spell
        {
            showToast(message: "You casted: \(sp.name)")
        }
    }
    
    
    
    @IBAction func swipeHandler(_ sender: Any)
    {
        castSpell()
        changeViewColor()
    }
    
    func changeViewColor()
    {
        var color:UIColor?
        
        let school = SchoolEnumS(rawValue:(spell?.school)!)
        switch school!.rawValue {
        case SchoolEnumS.Abjuration.rawValue:
            color = UIColor.blue
            break
        case  SchoolEnumS.Evocation.rawValue:
            color = UIColor.red
            break
        case SchoolEnumS.Divination.rawValue:
            color = UIColor.cyan
            break
        case  SchoolEnumS.Conjuration.rawValue:
            color = UIColor.green
            break
        case  SchoolEnumS.Enchantment.rawValue:
            color = UIColor.yellow
            break
        case  SchoolEnumS.Necromancy.rawValue:
            color = UIColor.purple
            break
        case  SchoolEnumS.Illusion.rawValue:
            color = UIColor.orange
            break
        default:
            color = UIColor.purple
            break
        }
       
        UIView.animate(withDuration: 1.5, animations:
        {
            self.SPELLvIEW.backgroundColor = color
        })
        
        UIView.animate(withDuration: 2.5, animations:
        {
            self.SPELLvIEW.backgroundColor = self.defaultColor
        })
        
    }
    
}
