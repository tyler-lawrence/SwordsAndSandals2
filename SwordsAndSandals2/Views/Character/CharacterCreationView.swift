//
//  CharacterCreationView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI

struct CharacterCreationView: View {
    
    @State var appManager: AppManager
    @State var gameManager = GameManager()
    
    var body: some View {
        VStack{
            
            Spacer()
            TextField("name", text: $gameManager.player.name)
                .font(.largeTitle)
            CharacterView(character: gameManager.player)
            StatManagerView(player: $gameManager.player)
            
            Spacer()
            
            Button("Begin"){
                appManager.saveGame(gameManager)
                appManager.selectedGame = gameManager
                appManager.appState = .playing
            }
            .buttonStyle(.borderedProminent)
            .disabled(gameManager.player.skillPointsAvailable != 0)
        }
        .padding()
        .onAppear{
            startBackgroundSound(sound: "Intro", type: "mp3")
        }
        .onDisappear{
            stopBackgroundSound()
        }
        
    }
}

#Preview {
    CharacterCreationView(appManager: AppManager.sample)
}
