//
//  CharacterCombatView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct CharacterCombatView: View {
    @State var character: GameCharacter
    
    var body: some View {
        VStack{
            Text(character.name)
            if character.currentHealth > 0 {
                HealthBarView(character: character)
                CharacterView(character: character)
                    .livingCharacter()
            } else {
                CharacterView(character: character)
                    .deadCharacter()
            }
        }
        
    }
}


#Preview {
    CharacterCombatView(character: GameCharacter.prisoner)
}

#Preview {
    CharacterCombatView(character: GameCharacter.sampleDeadCharacter)
}
