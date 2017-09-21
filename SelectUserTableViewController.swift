//
//  SelectUserTableViewController.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class SelectUserTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.instance.loadUsers()
        
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "Papyrus"))
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        DataManager.instance.loadUsers()
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.instance.userList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellID"){
            let user = DataManager.instance.userList[indexPath.row]
            cell.textLabel?.text = user.user.name
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.instance.currentUser = DataManager.instance.userList[indexPath.row]
        _ = navigationController?.popViewController(animated: true)
        
    }

}

extension SelectUserTableViewController:RefreshTableProtocol
{
    func refresh() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
