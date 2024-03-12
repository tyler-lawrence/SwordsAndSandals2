//
//  CharacterCreationView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI

struct CharacterCreationView: View {
    
    @Environment(AppManager.self) var appManager
    @State var gameManager = GameManager()
    
    var body: some View {
        VStack{
            
            Spacer()
            TextField("name", text: $gameManager.player.name)
                .font(.largeTitle)
            CharacterView(character: gameManager.player)
            StatManagerView(player: $gameManager.player)
            
            Spacer()
            
            NavigationLink("Begin"){
                ContentView()
                    .environment(gameManager)
                    .navigationBarBackButtonHidden()
                    
            }
            .buttonStyle(.borderedProminent)
            .simultaneousGesture(
                TapGesture().onEnded{
                    appManager.saveGame(gameManager)
                }
            )
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
    CharacterCreationView()
        .environment(AppManager.sample)
}
