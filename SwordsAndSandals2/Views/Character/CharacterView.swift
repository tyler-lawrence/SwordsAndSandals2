//
//  CharacterView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct CharacterView: View {
    
    let character: GameCharacter
        
    var body: some View {

        ZStack{
            Image("Head")
                .resizable()
                .scaledToFit()
            Image("Legs")
                .resizable()
                .scaledToFit()
            Image("Torso")
                .resizable()
                .scaledToFit()

            //MARK: items
            if let headArmor = character.inventory.head {
                Image(headArmor.equippedItemImagePath)
                    .resizable()
                    .scaledToFit()
            }
            
            
            if let weapon = character.inventory.weapon {
                Image(weapon.equippedItemImagePath)
                    .resizable()
                    .scaledToFit()
            }
            
            if let torsoArmor = character.inventory.torso {
                Image(torsoArmor.equippedItemImagePath)
                    .resizable()
                    .scaledToFit()
            }
            
            if let legArmor = character.inventory.legs {
                Image(legArmor.equippedItemImagePath)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    CharacterView(character: GameCharacter.sample)
}
