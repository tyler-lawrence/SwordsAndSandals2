//
//  CombatManager.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation

@Observable
class CombatManager {
    
    var player: GameCharacter
    var enemy: GameCharacter
    var playerAction: CombatAction?
    var roundOver: Bool = false
    var gameOver: Bool = false
    var playerDamageTaken: Int?
    var enemyDamageTaken: Int?
   
    
    init(player: GameCharacter, enemy: GameCharacter) {
        self.player = player
        self.enemy = enemy
    }
    
    func playerTurn() {
        guard let playerAction else { return }
        enemyDamageTaken = player.attack(enemy, using: playerAction)
    }
    
    func enemyTurn() {
        playerDamageTaken = enemy.attack(player, using: enemy.attackPreference())
    }
    
    func distributeRewards() {
        player.currentExperience += 5
        player.gold += 3
    }
    
    func processRound() {
        playerTurn()
        
        if enemy.currentHealth > 0 {
            enemyTurn()
        }
        playerAction = nil
        
        if enemy.currentHealth <= 0 {
            roundOver = true
            distributeRewards()
        }
        
        if player.currentHealth <= 0 {
            gameOver = true
        }
    }
}

#if DEBUG
extension CombatManager{
    static let testCM: CombatManager = CombatManager(player: GameCharacter.sample, enemy: GameCharacter.boss1)
}
#endif
