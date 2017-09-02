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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
}
