//
//  CombatAction.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation

enum CombatAction: String, CaseIterable {
    
    case strengthAttack = "Strength"
    case agilityAttack = "Agility"
    case magicAttack = "Magic"
    
    var icon: String {
        switch self {
        case .strengthAttack:
            return "⚒️"
        case .agilityAttack:
            return  "⚔️"
        case .magicAttack:
            return  "☄️"
        }
    }
    
    var stat: StatType {
        switch self {
        case .strengthAttack:
            return .strength
        case .agilityAttack:
            return .agility
        case .magicAttack:
            return .magic
        }
    }
    
    var accuracy: Double {
        switch self {
        case .strengthAttack:
            return 0.8
        case .agilityAttack:
            return 0.9
        case .magicAttack:
            return 0.6
        }
    }
    
    var damageModifier: Double {
        switch self {
        case .strengthAttack:
            return 1.2
        case .agilityAttack:
            return 1.1
        case .magicAttack:
            return 1.4
        }
    }
}
