//
//  HealerView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/25/24.
//

import SwiftUI

struct HealerView: View {
    
    @Environment(GameManager.self) var gameManager
    @State var player: GameCharacter
    
    var body: some View {
        VStack{
            HStack{
                HealButton(service: .five)
                HealButton(service: .full)
            }
            .environment(player)
            .padding(.bottom)
            
            Button("return to town"){
                gameManager.gameState = .town
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    HealerView(player: GameCharacter.sample)
        .environment(GameManager.sample)
}
