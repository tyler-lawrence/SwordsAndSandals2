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
            CharacterView()
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
        
    }
}

#Preview {
    CharacterCreationView()
        .environment(AppManager.sample)
}
