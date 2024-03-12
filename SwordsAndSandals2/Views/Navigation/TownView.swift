//
//  TownView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct TownView: View {
    @Environment(GameManager.self) var gameManager
    @State private var showingPlayerDetailsSheet = false
    var player: GameCharacter {
        gameManager.player
    }
    var body: some View {
        VStack{
            HStack {
                PlayerSummaryView()
                    .environment(player)
                    .onTapGesture {
                        showingPlayerDetailsSheet.toggle()
                    }
                Spacer()
            }
            Button{
                let enemy = gameManager.newWeakCharacter()
                gameManager.gameState = .combat(enemy)
            } label: {
                Text("Combat")
            }
            Button{
                gameManager.gameState = .shop
            } label: {
                Text("Shop")
            }
            Spacer()
        }
        .sheet(isPresented: $showingPlayerDetailsSheet){
            PlayerDetailsView()
                .environment(player)
        }
    }
}

#Preview {
    TownView()
        .environment(GameManager.sample)
}
