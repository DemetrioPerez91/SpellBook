//
//  User.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import Foundation
import RealmSwift
class User:Object
{
    override class func primaryKey()->String{return "id"}
    dynamic var id = UUID().uuidString
    dynamic var name = ""
    let spells  = List<Spell>()
}
