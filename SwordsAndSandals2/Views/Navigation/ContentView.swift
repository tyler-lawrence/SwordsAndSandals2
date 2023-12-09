//
//  ContentView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(GameManager.self) var gameManager
    var player: GameCharacter {
        gameManager.player
    }
    var body: some View {
        switch gameManager.gameState {
        case .tutorial:
            CombatView(cm: CombatManager(player: player, enemy: GameCharacter.prisoner))
        case .combat(let enemy):
            CombatView(cm: CombatManager(player: player, enemy: enemy))
        case .main:
            TownView()
            
        case .shop:
            ShopView()
        case .levelUp:
            LevelUpView(gameManager: gameManager)
        case .transition:
            TransitionView()
        }
        
    }
    
}

#Preview {
    ContentView()
        .environment(GameManager.sample)
}
