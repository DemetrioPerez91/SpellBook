//
//  MainMenuTableViewController.swift
//  Spellbook
//
//  Created by User on 8/30/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "Papyrus"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let user = DataManager.instance.currentUser?.user
        {
            return "User: \(user.name)"
        }
        else
        {
            return "User not selected"
        }
        
    }

}
