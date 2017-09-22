//
//  Enum.swift
//  Spellbook
//
//  Created by User on 8/28/17.
//  Copyright © 2017 DemetrioPerez. All rights reserved.
//

import Foundation

enum SchoolEnum:Int
{
    case Necro = 0,
        Evo = 1,
        Conju = 2,
        Abju = 3,
        Illu = 4,
        Encha = 5,
        Divi = 6
    
    static var count: Int { return SchoolEnum.Divi.hashValue + 1 }

    var description: String {
        switch self {
        case .Necro: return "Necromancy"
        case .Evo   : return "Evocation"
        case .Conju  : return "Conjuration"
        case .Abju : return "Abjuration"
        case .Illu   : return "Illusion"
        case .Encha  : return "Enchantment"
        case .Divi : return "Divination"
        }
    }
}



enum SchoolEnumS: String {
   
    case Necromancy = "Necromancy"
    case Evocation =  "Evocation"
    case Conjuration = "Conjuration"
    case Abjuration =  "Abjuration"
    case Illusion =  "Illusion"
    case Enchantment = "Enchantment"
    case Divination = "Divination"
    
}
