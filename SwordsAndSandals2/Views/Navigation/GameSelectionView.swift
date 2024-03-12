//
//  GameSelectionView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI

struct GameSelectionView: View {
    
    @Environment(AppManager.self) var appManager
    
    var body: some View {
        NavigationStack {
            List(appManager.gameManagers){ gameManager in
                NavigationLink(gameManager.player.name){
                    ContentView()
                        .environment(gameManager)
                        .navigationBarBackButtonHidden()
                }
                    
            }
            .toolbar{
                ToolbarItem{
                    NavigationLink{
                        CharacterCreationView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
       
    }
}

#Preview {
    GameSelectionView()
        .environment(AppManager.sample)
}
