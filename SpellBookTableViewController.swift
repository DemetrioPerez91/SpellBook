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
    var selectedSpell:SpellVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = DataManager.instance.currentUser?.user{
            spellList = RealmManager.instance.getUserSpells(user)
        }
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "Papyrus"))
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CastSpellSegue"
        {
            //SET SPELL NAME FOR THE VIEW
            let vc = segue.destination as! CastSpellViewController
            vc.spell = selectedSpell?.spell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSpell = spellList[indexPath.row]
        performSegue(withIdentifier: "CastSpellSegue", sender: nil)
    }
    

}
