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
    var gameState: GameState = .main
    var player: GameCharacter
//    var bosses: [GameCharacter] = [Character.boss1, Character.boss2]
    
    init() {
        self.player = GameCharacter(name: "Gladiator", maxHealth: 10)
    }
    
    
//    func newWeakCharacter() -> Character {
//        let c = GameCharacter(name: "local punk", maxHealth: 10)
////        let preferredStat: StatType = c.attackPreference().stat
////        c.baseStats[preferredStat] = 3
////        c.inventory.weapon = Weapon.stick
////        c.bodyColor = Color.randomColor()
//        return c
//    }
}

#if DEBUG
extension GameManager {
    static let sample = GameManager()
}
#endif
