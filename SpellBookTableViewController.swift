//
//  SpellBookTableViewController.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class SpellBookTableViewController: UITableViewController {

    var spellList:[SpellVM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = DataManager.instance.currentUser?.user{
            spellList = RealmManager.instance.getUserSpells(user)
        }

        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return spellList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        let spell = spellList[indexPath.row]
        cell?.textLabel?.text = spell.spellName
        cell?.detailTextLabel?.text = spell.spellSchool
        return cell!
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            RealmManager.instance.removeSpellFromBook(indexPath.row)
            spellList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}
