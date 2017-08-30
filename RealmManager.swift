//
//  RealmManager.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit
import RealmSwift
class RealmManager: NSObject
{

    static let instance = RealmManager()
    override private init(){}
    
    
    func saveSpell(spell:Spell)
    {
        let realm = try! Realm()
         try! realm.write {
           realm.add(spell)
        }
    }
    
    func getSpells()->[SpellVM]
    {
        var result:[SpellVM] = []
        let realm = try! Realm()
        let spells = realm.objects(Spell.self)
        for spell in spells { result.append(SpellVM(spell: spell))}
        return result
    }
    
    func getUsers(completion:@escaping ([UserVM])->())
    {
        var result:[UserVM] = []
        
            let realm = try! Realm()
            let users = realm.objects(User.self)
            for user in users { result.append(UserVM(user: user))}
            completion(result)
        
        
        
        
    }
    
    func getUserSpells(_ user:User)->[SpellVM]
    {
        var result:[SpellVM] = []
        let spells = user.spells
        for spell in spells { result.append(SpellVM(spell: spell))}
        return result
    }
    
    func saveUser(_ user:User)
    {
        let realm = try! Realm()
        try! realm.write
        {
            realm.add(user)
        }
    }
    
    func addUserSpell(_ spell: Spell, _ user:User)
    {
        let realm = try! Realm()
        try! realm.write {
            user.spells.append(spell)

       }
    }
    
    func deleteSpell( _ spell:Spell)
    {
        let realm = try! Realm()
        try! realm.write
        {
            realm.delete(spell)
        }
    }
    
    func removeSpellFromBook(_ index:Int)
    {
        if let user = DataManager.instance.currentUser?.user
        {
            let realm = try! Realm()
            try! realm.write
                {
                    user.spells.remove(objectAtIndex: index)
            }
        }
    }
    
}
