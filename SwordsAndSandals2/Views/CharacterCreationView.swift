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
            
            Spacer()
            
            NavigationLink("Begin"){
                ContentView()
                    .environment(gameManager)
                    .navigationBarBackButtonHidden()
            }
            .buttonStyle(.borderedProminent)
            .simultaneousGesture(
                TapGesture().onEnded{
                    appManager.saveGameToDisk(gameManager)
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
