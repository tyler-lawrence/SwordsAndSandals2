//
//  GameManager.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import Foundation


@Observable
final class GameManager: Identifiable, Codable {
    
    var id = UUID()
    var gameState: GameState = .tutorial
    var player: GameCharacter
    var shop = Shop()
    
    init() {
        self.player = GameCharacter(name: "Gladiator", maxHealth: 10)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(UUID.self, forKey: ._id)
        self._gameState = try container.decode(GameState.self, forKey: ._gameState)
        self._player = try container.decode(GameCharacter.self, forKey: ._player)
    }
    
    func newWeakCharacter() -> GameCharacter {
        let c = GameCharacter(name: "local punk", maxHealth: 10)
        let preferredStat: StatType = c.attackPreference().stat
        c.baseStats[preferredStat] = 3
//        c.inventory.weapon = Weapon.stick
//        c.bodyColor = Color.randomColor()
        return c
    }
}

#if DEBUG
extension GameManager {
    static var sample: GameManager {
        let gm = GameManager()
        gm.player.inventory.allItems.append(Item.basicSword)
        return gm
    }
    
}
#endif
