//
//  GameCharacter+NPCs.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation

extension GameCharacter {
    func attackPreference() -> CombatAction {
        let combatStatTypes: [StatType] = [.strength, .agility, .magic]
        let combatStats: StatDictionary = totalStats.filter{combatStatTypes.contains($0.key)}
        let strongestStatKV: (StatType, Int)? = combatStats.max { a, b in a.value < b.value }
        var combatAction: CombatAction = .magicAttack
        if let strongestStatKV {
            switch strongestStatKV.0 {
            case .magic:
                combatAction = .magicAttack
            case .agility:
                combatAction = .agilityAttack
            case .strength:
                combatAction = .strengthAttack
            default:
                combatAction = .magicAttack
            }
            
        }
        return combatAction
    }
        
    
    //MARK: - NPCs
    /*
     in game NPCs must be static constants
     */
    static let prisoner: GameCharacter = GameCharacter(
        name: "Prisoner",
        maxHealth: 5
    )
    
    static let boss1 = GameCharacter(
        name: "Big Billy",
        maxHealth: 15,
        stats: [
            .strength: 6,
            .agility: 1,
            .magic: 1
        ],
        inventory: Inventory(head: Item.helmet, torso: nil, legs: nil, weapon: Item.dagger, allItems: [])
    )
}
