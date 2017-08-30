//
//  SpellVM.swift
//  Spellbook
//
//  Created by User on 8/29/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import UIKit

class SpellVM: NSObject
{
    let spell:Spell
    init(spell:Spell) {
        self.spell = spell
    }
    
    var spellName:String{get{return "Name: \(spell.name)"}}
    var spellLevel:String{get{return "Level: \(spell.level)"}}
    var spellComponents:String{get{return "Components: \(spell.components)"}}
    var spellSchool:String{get{return "School: \(spell.school))"}}
    
 
    
}
