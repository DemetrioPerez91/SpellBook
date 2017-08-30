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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SaveUser(_ sender: Any)
    {
        guard userNAME.text != "" else{return}
        let newUser = User()
        newUser.name = userNAME.text!
        RealmManager.instance.saveUser(newUser)
        _ = navigationController?.popViewController(animated: true)
    }
   
}
