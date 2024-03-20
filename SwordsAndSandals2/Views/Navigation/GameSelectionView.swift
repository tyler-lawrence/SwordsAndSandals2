//
//  GameSelectionView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI

struct GameSelectionView: View {
    
    @Environment(AppManager.self) var appManager
    @State var showingSheet = false
    
    var body: some View {
        if appManager.gameManagers.isEmpty {
            CharacterCreationView(appManager: appManager)
        } else {
            HStack {
                // character list
                VStack{
                    List{
                        ForEach(appManager.gameManagers){ gameManager in
                            Button(gameManager.player.name){
                                appManager.selectedGame = gameManager
                            }
                        }
                        .onDelete(perform: delete(at:))
                        Button("New"){
                            showingSheet.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                }
                
                // character view
                if let character = appManager.selectedGame?.player {
                    VStack{
                        Spacer()
                        Text(character.name)
                        Text("Level: \(character.level)")
                        CharacterView(character: character)
                        Spacer()
                        Button("Enter"){
                            appManager.appState = .playing
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(appManager.selectedGame == nil)
                    }
                }
            }
            .sheet(isPresented: $showingSheet){
                CharacterCreationView(appManager: appManager)
            }
        }
    }
    
    
    
    
    func delete(at offsets: IndexSet) {
        appManager.remove(at: offsets)
    }
}

#Preview {
    GameSelectionView()
        .environment(AppManager.sample)
}
