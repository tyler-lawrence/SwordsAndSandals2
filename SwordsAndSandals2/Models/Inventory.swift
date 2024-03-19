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
    
    func indexForItem(_ item: Item) -> Int? {
        allItems.firstIndex{ $0.id == item.id }
    }
    
    mutating func remove(item: Item) {
        if let index = indexForItem(item){
            allItems.remove(at: index)
        }
    }
    
    mutating func equip(_ item: Item, at slot: ItemSlot) {
        guard item.itemSlot == slot else { return }
        
        switch slot {
        case .head:
            if let headItem = head {
                allItems.append(headItem)
            }
            head = item
        case .torso:
            if let torsoItem = torso {
                allItems.append(torsoItem)
            }
            torso = item
        case .legs:
            if let legsItem = legs {
                allItems.append(legsItem)
            }
            legs = item
        case .weapon:
            if let weaponItem = weapon {
                allItems.append(weaponItem)
            }
            weapon = item
        }
        remove(item: item)
    }
    
    func itemPath(for slot: ItemSlot) -> String? {
        switch slot {
        case .head:
            head?.iconImagePath
        case .torso:
            torso?.iconImagePath
        case .legs:
            legs?.iconImagePath
        case .weapon:
            weapon?.iconImagePath
        }
    }
}
