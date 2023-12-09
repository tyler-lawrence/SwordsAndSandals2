//
//  PlayerSummaryView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct PlayerSummaryView: View {
    @Environment(GameCharacter.self) var player
    var body: some View {
        VStack(alignment: .leading){
            Text(player.name)
                .font(.title)
            Text("💰 \(player.gold)")
            Text("❤️ \(player.currentHealth) / \(player.maxHealth)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundStyle(.bar)
        )
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    PlayerSummaryView()
        .environment(GameCharacter.sample)
}
