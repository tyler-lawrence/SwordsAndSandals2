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
    var inventory: Inventory
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
        self.inventory = Inventory()
    }
    
    init(
        name: String,
        maxHealth: Int,
        stats: StatDictionary,
        inventory: Inventory
    ){
        self.name = name
        self.currentHealth = maxHealth
        self.maxHealth = maxHealth
        self.baseStats = stats
        self.inventory = Inventory()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._name = try container.decode(String.self, forKey: ._name)
        self._maxHealth = try container.decode(Int.self, forKey: ._maxHealth)
        self._currentHealth = try container.decode(Int.self, forKey: ._currentHealth)
        self._gold = try container.decode(Int.self, forKey: ._gold)
        self._skillPointsAvailable = try container.decode(Int.self, forKey: ._skillPointsAvailable)
        self._level = try container.decode(Int.self, forKey: ._level)
        self._currentExperience = try container.decode(Double.self, forKey: ._currentExperience)
        self._baseStats = try container.decode(StatDictionary.self, forKey: ._baseStats)
        self._inventory = try container.decode(Inventory.self, forKey: ._inventory)
    }
    
    func getTotalStat(for stat: StatType) -> Int {
        let base = baseStats[stat] ?? 0
        let bonus = inventory.getBonusStats(for: stat)
        return base + bonus
    }
    
    func buy(_ item: Item) {
        guard gold >= item.price else { return }
        gold -= item.price
        inventory.allItems.append(item)
        success()
    }
    
    func attemptAttack(using combatAction: CombatAction) -> Bool {
        let attackRoll: Double = Double.random(in: 0.0 ... 1.0)
        let attackHit: Bool = attackRoll < combatAction.accuracy
        
        return attackHit
    }
    
    func attack(_ enemy: GameCharacter, using combatAction: CombatAction)  -> Int? {
        guard attemptAttack(using: combatAction) else {
            return nil
        }
        let attackPower: Int = getTotalStat(for: combatAction.stat)
        let enemyDefense: Int = switch combatAction.stat{
        case .magic:
            enemy.getTotalStat(for: .magicResist)
        default:
            enemy.getTotalStat(for: .armor)
        }
        
        let damageModifier: Double = combatAction.damageModifier
        let premitigationDamage: Double = Double(attackPower) * damageModifier
        let totalDamage: Int = max(0, Int(premitigationDamage) - enemyDefense)
        enemy.currentHealth -= totalDamage
        return totalDamage
    }
    
}

#if DEBUG
extension GameCharacter {
    static var sample: GameCharacter{
        let c = GameCharacter(name: "Sample", maxHealth: 10)
        c.inventory.weapon = .basicSword
        c.inventory.allItems = [.basicSword, .helmet, .plate]
        return c
    }
    
    static var sampleDeadCharacter: GameCharacter {
        let c = GameCharacter(
            name: "dead",
            maxHealth: 10
        )
        c.currentHealth = 0
        return c
    }
    
    static var sampleInjuredCharacter: GameCharacter {
        let c = GameCharacter(
            name: "Injured",
            maxHealth: 10
        )
        c.currentHealth = 5
        return c
    }
}
#endif
