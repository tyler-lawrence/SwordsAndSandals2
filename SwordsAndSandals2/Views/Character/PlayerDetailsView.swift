//
//  PlayerDetailsView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI
import TipKit

struct PlayerDetailsView: View {
    @Environment(GameCharacter.self) var player
    
    enum DetailOptions: String, CaseIterable {
        case stats = "Stats"
        case inventory = "Inventory"
    }
    
    var inventoryTip = InventoryTip()
    
    @State private var selection: DetailOptions = .inventory
    @State private var selectedItem: Item?
    
    let columns = [GridItem(), GridItem()]
    
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
            
            HStack {
                VStack{
                    Spacer()
                    InventoryIconCircleView(itemSlot: .head, draggedItem: $selectedItem)
                    Spacer()
                    InventoryIconCircleView(itemSlot: .torso, draggedItem: $selectedItem)
                    Spacer()
                    InventoryIconCircleView(itemSlot: .legs, draggedItem: $selectedItem)
                    Spacer()
                }
                .padding(.leading)
                CharacterView(character: player)
                VStack{
                    InventoryIconCircleView(itemSlot: .weapon, draggedItem: $selectedItem)
                }
                .padding(.trailing)
            }
            
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
                TipView(inventoryTip, arrowEdge: .bottom)
                ScrollView(.horizontal){
                    VStack {
                        LazyVGrid(columns: columns){
                            ForEach(player.inventory.allItems){ item in
                                ItemInventoryView(item: item)
                                    .draggable(item){
                                        Text("Drop in a slot")
                                            .onAppear{selectedItem = item}
                                    }
                            }
                        }
                        .padding(.leading)
                    }
                }
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
