//
//  PostCombatView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct PostCombatView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    var result: CombatResult
    
    var enemyName: String
    var body: some View {
        VStack{
            Text(result.rawValue)
                .font(.largeTitle)
            Text(result.header + enemyName)
            Button("Enter Town"){
                if gameManager.player.skillPointsAvailable > 0 {
                    gameManager.gameState = .levelUp
                } else {
                    gameManager.gameState = .transition
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundColor(result.backgroundColor)
                .shadow(color: .primary, radius: 5.0)
        )
        
    }
}

#Preview {
    VStack{
        PostCombatView(result: .victory, enemyName: "Enemy")
        PostCombatView(result: .defeat, enemyName: "Enemy")
    }
    .environment(GameManager.sample)
}
