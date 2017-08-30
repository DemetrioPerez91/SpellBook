//
//  DataManager.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

protocol RefreshTableProtocol {
    func refresh()
}

class DataManager: NSObject
{
    static let instance = DataManager()
    override private init(){}
    
    var spellList:[SpellVM] = []
    var userList:[UserVM] = []
    var currentUser:UserVM?
    var refreshDelegate:RefreshTableProtocol?
    
    func loadSpells()
    {
        spellList = RealmManager.instance.getSpells()
    }
    func loadUsers()
    {
        RealmManager.instance.getUsers(completion: {
            users in
            self.userList = users
            self.refreshDelegate?.refresh()
        })
    }
    
}
