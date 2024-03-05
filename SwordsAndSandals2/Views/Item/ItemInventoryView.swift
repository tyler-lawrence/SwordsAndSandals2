//
//  ItemInventoryView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/10/23.
//

import SwiftUI

struct ItemInventoryView: View {
    
    let item: Item
    @State var showingDetails = false
    
    var body: some View {
        InventoryIconCircleView(color: .gray)
            .overlay{
                Image(item.iconImagePath)
            }
            .onTapGesture {
                showingDetails.toggle()
            }
            .sheet(isPresented: $showingDetails){
                ItemDetailsView(item: item)
                    .presentationDetents([.medium])
            }
            
    }
}

#Preview {
    ItemInventoryView(item: Item.basicSword)
}
