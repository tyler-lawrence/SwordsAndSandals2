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
        ZStack {
            Image(.town1)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                HStack {
                    Button{
                        showingPlayerDetailsSheet.toggle()
                    } label: {
                        PlayerSummaryView()
                            .environment(player)
                    }
                    Spacer()
                }
                BuildingView(destination: .boss(GameCharacter.boss1), buildingImagePath: "Town1Boss")
                    .overlay{
                        if player.level < 4 {
                            RoundedRectangle(cornerRadius: 15.0)
                                .foregroundStyle(.white)
                                .opacity(0.8)
                                .overlay{
                                    Image(systemName: "lock.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                        .foregroundStyle(.black)
                                }
                        }
                    }
                Spacer()
                BuildingView(destination: .healer, buildingImagePath: "Town1Tent")
                Spacer()
                HStack{
                    BuildingView(destination: .shop, buildingImagePath: "Town1Hut")
                        .environment(gameManager)
                    BuildingView(destination: .training(gameManager.newWeakCharacter()), buildingImagePath: "Town1Training")
                        .environment(gameManager)
                }
                Spacer()

            }
            .sheet(isPresented: $showingPlayerDetailsSheet){
                PlayerDetailsView()
                    .environment(player)
        }
        }
    }
}

#Preview {
    TownView()
        .environment(GameManager.sample)
}
