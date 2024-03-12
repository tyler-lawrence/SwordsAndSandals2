//
//  Inventory.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation

struct Inventory: Codable {
    
    var head: Item?
    var torso: Item?
    var legs: Item?
    var weapon: Item?
    
    var allItems = [Item]()
    
    var equippedItems: [Item] {
        var items = [Item]()
        if let head {
            items.append(head)
        }
        if let torso {
            items.append(torso)
        }
        if let legs {
            items.append(legs)
        }
        if let weapon {
            items.append(weapon)
        }
        
        return items
    }
    
    func getBonusStats(for statType: StatType) -> Int {
       
        // repeat for every item slot
        let weaponStat: Int = weapon?.stats[statType] ?? 0
        let torsoArmorStat: Int = torso?.stats[statType] ?? 0
        let legArmorStat: Int = legs?.stats[statType] ?? 0
        let headArmorStat: Int = head?.stats[statType] ?? 0
        
        return weaponStat + torsoArmorStat + legArmorStat + headArmorStat
    }
    
}
