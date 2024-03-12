//
//  PlayerDetailsView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct PlayerDetailsView: View {
    @Environment(GameCharacter.self) var player
    
    enum DetailOptions: String, CaseIterable {
        case stats = "Stats"
        case inventory = "Inventory"
    }
    
    @State private var selection: DetailOptions = .inventory
    
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
                    VStack(alignment: .leading){
                        Text("💰 \(player.gold)")
                        Text("❤️ \(player.currentHealth) / \(player.maxHealth)")
                    }
                    
                }
                ExpBarView(player: player)
                
            }
            .padding()
            .background(.bar)
            
            CharacterView(character: player)
            
            Spacer()
            
            Picker("", selection: $selection){
                ForEach(DetailOptions.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            if selection == .stats {
                StatsView(stats: player.totalStats)
                    .padding(.horizontal)
            } else {
                AllItemsView(player: player)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    PlayerDetailsView()
        .environment(GameCharacter.sample)
}

#Preview {
    TownView()
        .environment(GameManager.sample)
}
