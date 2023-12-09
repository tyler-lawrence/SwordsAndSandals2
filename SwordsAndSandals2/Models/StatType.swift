//
//  StatType.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import Foundation

typealias StatDictionary = [StatType: Int]

enum StatType: String, CaseIterable, Codable {
    
    case strength = "Strength"
    case agility = "Agility"
    case magic = "Magic"
    case armor = "Armor"
    case magicResist = "Magic Resist"
    
    static var combatStats: [StatType] = [.strength, .agility, .magic]
    
    static let baseStatBlock: StatDictionary = [
        .strength: 1,
        .agility: 1,
        .magic: 1,
        .armor: 1,
        .magicResist: 1,
    ]
        
}
