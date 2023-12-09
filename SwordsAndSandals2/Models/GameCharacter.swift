//
//  GameCharacter.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import Foundation

@Observable
final class GameCharacter: Codable {
    
    // MARK: attributes
    var name: String
    var maxHealth: Int
    var currentHealth: Int
    var gold: Int = 0
    //    var bodyColor: Color = .blue
    //    var inventory: Inventory = Inventory()
    var skillPointsAvailable: Int = 4
    var level: Int = 1
    
    var currentExperience: Double = 0 {
        didSet{
            if currentExperience > experienceNeededToLevel {
                level += 1
                currentExperience = 0
                skillPointsAvailable = 4
            }
        }
    }
    var experienceNeededToLevel: Double {
        let expScaling = 1.1
        let nextLevel = level + 1
        return pow(Double(nextLevel), 2) * expScaling
    }
    
    //Mark: Stats
    var baseStats: StatDictionary
    
    var totalStats: StatDictionary {
        var d = [StatType: Int]()
        for k in baseStats.keys {
            d[k] = getTotalStat(for: k)
        }
        return d
    }
    
    init(name: String, maxHealth: Int){
        self.name = name
        self.currentHealth = maxHealth
        self.maxHealth = maxHealth
        self.baseStats = StatType.baseStatBlock
        //        self.bodyColor = bodyColor
    }
    
    init(
        name: String,
        maxHealth: Int,
        stats: StatDictionary
        //        bodyColor: Color,
        //        inventory: Inventory
    ){
        self.name = name
        self.currentHealth = maxHealth
        self.maxHealth = maxHealth
        self.baseStats = stats
        //        self.bodyColor = bodyColor
        //        self.inventory = Inventory()
    }
    
    func getTotalStat(for stat: StatType) -> Int {
        let base = baseStats[stat] ?? 0
        //        let bonus = inventory.getBonusStats(for: stat)
        //        return base + bonus
        return base
    }
    
    //    func buy(_ item: any Purchasable) {
    //        guard gold >= item.price else { return }
    //
    //        switch item.itemSlot {
    //        case .head:
    //            if let headArmor = item as? Armor {
    //                inventory.headArmor = headArmor
    //            }
    //        case .torso:
    //            if let torsoArmor = item as? Armor {
    //                inventory.torsoArmor = torsoArmor
    //            }
    //        case .legs:
    //            if let legArmor = item as? Armor {
    //                inventory.legArmor = legArmor
    //            }
    //        case .weapon:
    //            if let weapon = item as? Weapon {
    //                inventory.weapon = weapon
    //            }
    //        }
    //        gold -= item.price
    //    }
    //
    //    func attemptAttack(using combatAction: CombatAction) -> Bool {
    //        let attackRoll: Double = Double.random(in: 0.0 ... 1.0)
    //        let attackHit: Bool = attackRoll < combatAction.accuracy
    //
    //        return attackHit
    //    }
    //
    //    func attack(_ enemy: Character, using combatAction: CombatAction)  -> Int? {
    //        guard attemptAttack(using: combatAction) else {
    //            return nil
    //        }
    //        let attackPower: Int = getTotalStat(for: combatAction.stat)
    //        let enemyDefense: Int = switch combatAction.stat{
    //        case .magic:
    //            enemy.getTotalStat(for: .magicResist)
    //        default:
    //            enemy.getTotalStat(for: .armor)
    //        }
    //
    //        let damageModifier: Double = combatAction.damageModifier
    //        let premitigationDamage: Double = Double(attackPower) * damageModifier
    //        let totalDamage: Int = max(0, Int(premitigationDamage) - enemyDefense)
    //        enemy.currentHealth -= totalDamage
    //        return totalDamage
    //    }
    
}

extension GameCharacter {
    static let sample = GameCharacter(name: "Sample", maxHealth: 10)
}
