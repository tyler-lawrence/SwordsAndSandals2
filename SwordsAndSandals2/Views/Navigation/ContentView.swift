//
//  ContentView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(GameManager.self) var gameManager
    @State var appManager: AppManager
    
    var player: GameCharacter {
        gameManager.player
    }
    
    var body: some View {
        switch gameManager.gameState {
        case .tutorial:
            CombatView(appManager: appManager, cm: CombatManager(player: player, enemy: GameCharacter.prisoner, bossCombat: false))
        case .training(let enemy):
            CombatView(appManager: appManager, cm: CombatManager(player: player, enemy: enemy, bossCombat: false))
                .onDisappear{
                    player.currentHealth = max(2, player.currentHealth)
                }
        case .boss(let enemy):
            #warning("update with real boss")
            CombatView(appManager: appManager, cm: CombatManager(player: player, enemy: enemy, bossCombat: true))
        case .town:
            TownView()
        case .healer:
            HealerView(player: player)
                .environment(gameManager)
        case .shop:
            ShopView()
        case .levelUp:
            LevelUpView(gameManager: gameManager)
        case .transition:
            TransitionView()
        case .gameOver:
            GameOverView(appManager: appManager, player: player)
        }
    }
}

#Preview {
    ContentView(appManager: AppManager.sample)
        .environment(GameManager.sample)
}
