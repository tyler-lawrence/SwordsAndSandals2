//
//  PlayerDetailsView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct PlayerDetailsView: View {
    @Environment(GameCharacter.self) var player
    var body: some View {
        VStack{
            // header
            VStack{
                HStack{
                    Text("Level \(player.level)")
                    Spacer()
                    Text(player.name)
                        .font(.title)
                    Spacer()
                    VStack{
                        Text("💰 \(player.gold)")
                        Text("❤️ \(player.currentHealth) / \(player.maxHealth)")
                    }
                    
                }
                ExpBarView(player: player)
            }
            .padding()
            .background(.bar)
            Spacer()
            
            CharacterView()
            StatsView(stats: player.totalStats)
                .padding(.horizontal)
            Spacer()
        }
        
    }
}

#Preview {
    PlayerDetailsView()
        .environment(GameCharacter.sample)
}
