//
//  SpellListTableViewController.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class SpellListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.instance.loadSpells()
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "Papyrus"))
    }

    override func viewWillAppear(_ animated: Bool) {
        DataManager.instance.loadSpells()
        tableView.reloadData()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.instance.spellList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        let spell = DataManager.instance.spellList[indexPath.row]
        cell?.textLabel?.text = spell.spellName
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spell = DataManager.instance.spellList[indexPath.row]
        if let user = DataManager.instance.currentUser?.user{
            RealmManager.instance.addUserSpell(spell.spell, user)
            showToast(message: "Added \(spell.spell.name)")
        }
        else
        {
            showToast(message: "Please select a User")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let spell = DataManager.instance.spellList[indexPath.row].spell
            
            RealmManager.instance.deleteSpell(spell)
            DataManager.instance.spellList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
  

}
