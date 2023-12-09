//
//  StatManagerView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct StatManagerView: View {
    
    @Binding var player: GameCharacter
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("points remaining: \(player.skillPointsAvailable)")
                .bold()
            
            ForEach(StatType.combatStats, id: \.self){ stat in
                StatStepperView(player: $player, stat: stat)
            }
            
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.brown)
                .opacity(0.2)
        }
       
    }
    
}

#Preview {
    StatManagerView(player: .constant(GameCharacter.sample))
}

