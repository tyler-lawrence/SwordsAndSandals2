//
//  ShopView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct ShopView: View {
    
    @Environment(GameManager.self) var gameManager
    @State var showingAlert = false
    @State var selectedItem: Item?
    
    var alertMessage: String {
        guard let selectedItem else { return "" }
        return "Are you sure you want to buy \(selectedItem.name)?"
    }
    
    var body: some View {
        VStack{
            HStack{
                Button("Leave"){
                    gameManager.gameState = .main
                }
                Spacer()
                Text("\(gameManager.player.gold) 💰")
            }
            .padding(.horizontal)
            
            ScrollView{
                ForEach(gameManager.shop.items, id:\.id) { item in
                    Button{
                        selectedItem = item
                        showingAlert.toggle()
                    } label: {
                        ItemDetailView(item: item)
                            .padding(.horizontal)
                    }
                    .disabled(gameManager.player.gold < item.price)
                }
            }
            
            .alert(alertMessage, isPresented: $showingAlert){
                Button("Cancel", role: .cancel){}
                Button("Buy", role: .destructive){
                    if let selectedItem{
                        gameManager.player.buy(selectedItem)
                    }
                }
            }
        }
    }
}

#Preview {
    ShopView()
        .environment(GameManager.sample)
}
