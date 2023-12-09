//
//  PostCombatView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct PostCombatView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    
    var enemyName: String
    var body: some View {
        VStack{
            Text("Victory!")
            Text("You defeated \(enemyName)")
            Button("Enter Town"){
                if gameManager.player.skillPointsAvailable > 0 {
                    gameManager.gameState = .levelUp
                } else {
                    gameManager.gameState = .transition
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundColor(.yellow)
        )
    }
}

#Preview {
    PostCombatView(enemyName: "Enemy")
        .environment(GameManager.sample)
}
