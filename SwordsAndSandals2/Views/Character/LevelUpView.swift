//
//  LevelUpView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct LevelUpView: View {
    @State var gameManager: GameManager
    @State var showingAnimation: Bool = true
    var body: some View {
        if showingAnimation {
            LevelUpAnimation(player: gameManager.player, showingAnimation: $showingAnimation)
        } else{
            VStack{
                Text("Level Up!")
                    .font(.largeTitle)
                CharacterView(character: gameManager.player)
                StatManagerView(player: $gameManager.player)
                Button("Enter Town"){
                    gameManager.gameState = .main
                }
                .buttonStyle(.borderedProminent)
                .disabled(gameManager.player.skillPointsAvailable != 0)
            }
        }
    }
}

#Preview {
    LevelUpView(gameManager: GameManager.sample)
        
}
