//
//  InventoryView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/13/23.
//

import SwiftUI

struct AllItemsView: View {
    
    let player: GameCharacter
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        
        ScrollView(.horizontal){
            LazyVGrid(columns: columns){
                ForEach(player.inventory.allItems){ item in
                    ItemInventoryView(item: item)
                    //                InventoryRowView(item: item)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    AllItemsView(player: GameCharacter.sample)
}
