//
//  CharacterView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct CharacterView: View {
    
//    let character: GameCharacter
        
    var body: some View {
            //MARK: basic
            ZStack{
                Image("Head")
                Image("Legs")
                Image("Torso")
            }
        
//            .foregroundColor(character.bodyColor)
            
            //MARK: items
//            if let headArmor = character.inventory.headArmor {
//                Image(headArmor.equippedItemImagePath())
//            }
//            
//            if let weapon = character.inventory.weapon {
//                Image(weapon.equippedItemImagePath())
//            }
//            
//            if let torsoArmor = character.inventory.torsoArmor {
//                Image(torsoArmor.equippedItemImagePath())
//            }
//            
//            if let legArmor = character.inventory.legArmor {
//                Image(legArmor.equippedItemImagePath())
//            }
        
    }
}

#Preview {
    CharacterView(/*character: GameCharacter.sample*/)
}
