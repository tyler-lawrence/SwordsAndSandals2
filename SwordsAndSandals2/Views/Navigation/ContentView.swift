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
            CombatView(appManager: appManager, cm: CombatManager(player: player, enemy: GameCharacter.prisoner))
        case .combat(let enemy):
            CombatView(appManager: appManager, cm: CombatManager(player: player, enemy: enemy))
        case .main:
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
