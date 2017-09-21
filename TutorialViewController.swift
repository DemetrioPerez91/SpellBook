//
//  TutorialViewController.swift
//  Spellbook
//
//  Created by User on 9/21/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func okButton(_ sender: Any)
    {
        _ = navigationController?.popViewController(animated: true)
         UserDefaults.standard.set(true, forKey: "hasFinishedTutorial")
    }


}
