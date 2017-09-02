//
//  CastSpellViewController.swift
//  Spellbook
//
//  Created by User on 9/2/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class CastSpellViewController: UIViewController {

    var spell:Spell?
    
    @IBOutlet var gestureRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
    
    func changeViewColor()
    {
        let school = SchoolEnumS(rawValue: (spell?.school)!)
        
    }
    
}
