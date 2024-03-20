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
            List{
                ForEach(appManager.gameManagers){ gameManager in
                    NavigationLink(gameManager.player.name){
                        ContentView()
                            .environment(gameManager)
                            .navigationBarBackButtonHidden()
                    }
                }
                .onDelete(perform: delete(at:))
                
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
            .overlay{
                if appManager.gameManagers.isEmpty {
                    ContentUnavailableView("Press the + to add a new game", systemImage: "arrow.up.forward")
                }
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
