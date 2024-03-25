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
    var bossCombat: Bool
    var result: CombatResult?
    
    init(player: GameCharacter, enemy: GameCharacter, bossCombat: Bool) {
        self.player = player
        self.enemy = enemy
        self.bossCombat = bossCombat
    }
    
    func playerTurn() {
        guard let playerAction else { return }
        enemyDamageTaken = player.attack(enemy, using: playerAction)
        enemy.currentHealth -= enemyDamageTaken ?? 0
    }
    
    func enemyTurn() {
        
        let damageDealt: Int? = enemy.attack(player, using: enemy.attackPreference())
        
        if let damageDealt {
            playerDamageTaken = damageDealt
            if bossCombat {
                if damageDealt >= player.currentHealth {
                    gameOver = true
                } else {
                    player.currentHealth -= damageDealt
                }
            } else {
                player.currentHealth = max(1, player.currentHealth - damageDealt)
            }
        }
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
            result = .victory
            roundOver = true
            distributeRewards()
        }
        
        if bossCombat {
            if player.currentHealth <= 0 {
                result = .defeat
                gameOver = true
            }
        } else {
            if player.currentHealth == 1 {
                result = .defeat
                roundOver = true
            }
        }
        
        
    }
}

#if DEBUG
extension CombatManager{
    static let testCM: CombatManager = CombatManager(player: GameCharacter.sample, enemy: GameCharacter.boss1, bossCombat: false)
}
#endif
