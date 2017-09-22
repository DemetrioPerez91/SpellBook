//
//  NewUserViewController.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {

    @IBOutlet weak var userNAME: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveUser(_ sender: Any)
    {
        guard userNAME.text != "" else{return}
        let newUser = User()
        newUser.name = userNAME.text!
        RealmManager.instance.saveUser(newUser)
        showToast(message: "User \(newUser.name) saved")
        _ = navigationController?.popViewController(animated: true)
    }
   
}
