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
                    VStack{
                        Text("💰 \(player.gold)")
                        Text("❤️ \(player.currentHealth) / \(player.maxHealth)")
                    }
                    
                }
                ExpBarView(player: player)
                Picker("", selection: $selection){
                    ForEach(DetailOptions.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
            }
            .padding()
            .background(.bar)
            Spacer()
            
            if selection == .stats {
                CharacterView()
                StatsView(stats: player.totalStats)
                    .padding(.horizontal)
            } else {
                InventoryView
            }
            
            
            Spacer()
        }
        
    }
    
    var InventoryView: some View {
        ForEach(player.inventory.allItems){ item in
                ItemDetailView(item: item)
        }
    }
}

#Preview {
    PlayerDetailsView()
        .environment(GameCharacter.sample)
}
