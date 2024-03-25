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
    @State private var showingBossLockAlert = false
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
                            Button{
                                showingBossLockAlert = true
                            } label: {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .foregroundStyle(Material.thin)
                                    .opacity(0.8)
                                    .blur(radius: 2)
                                    .overlay{
                                        Image(systemName: "lock.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                            .foregroundStyle(.black)
                                            .shadow(color: .yellow, radius: 3.0)
                                    }
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
        .alert("You are not high enough level", isPresented: $showingBossLockAlert){
            Button("OK, I will get stronger", role: .cancel){}
        }
    }
}

#Preview {
    TownView()
        .environment(GameManager.sample)
}
