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
    
    var allItems: [Item] = []
    
    func getBonusStats(for statType: StatType) -> Int {
       
        // repeat for every item slot
        let weaponStat: Int = weapon?.stats[statType] ?? 0
        let torsoArmorStat: Int = torso?.stats[statType] ?? 0
        let legArmorStat: Int = legs?.stats[statType] ?? 0
        let headArmorStat: Int = head?.stats[statType] ?? 0
        
        return weaponStat + torsoArmorStat + legArmorStat + headArmorStat
    }
    
    enum InventoryError: Error {
        case wrongSlot
    }
    
    mutating func equip(_ item: Item, at slot: ItemSlot) throws {
        
        guard item.itemSlot == slot else { throw InventoryError.wrongSlot }
        
        switch item.itemSlot {
        case .head:
            head = item
        case .torso:
            torso = item
        case .legs:
            legs = item
        case .weapon:
            weapon = item
        }
    }
    
    
}
