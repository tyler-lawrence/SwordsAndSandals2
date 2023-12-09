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
//            CombatView(cm: CombatManager(player: gameManager.player, enemy: Character.prisoner))
            Text("test")
        case .combat(let enemy):
//            CombatView(cm: CombatManager(player: gameManager.player, enemy: enemy))
            Text("test")
        case .main:
            TownView()
            
        case .shop:
//            ShopView()
            Text("test")
        case .levelUp:
//            LevelUpView()
            Text("test")
        case .transition:
//            TransitionView()
            Text("test")
        }
        
    }
    
}

#Preview {
    ContentView()
        .environment(GameManager.sample)
}
