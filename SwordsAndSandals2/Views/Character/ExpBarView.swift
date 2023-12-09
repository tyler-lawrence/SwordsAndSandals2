//
//  ExpBarView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct ExpBarView: View {
    let player: GameCharacter
    
    var expPercent: Double {
        player.currentExperience / player.experienceNeededToLevel
    }
    
    var expPercentLabel: String {
        String(format: "%.1f", expPercent)
    }
    
    var currentExpLabel: String {
        String(format: "%.0f", player.currentExperience)
    }
    var expNeededToLevelLabel: String {
        String(format: "%.0f", player.experienceNeededToLevel)
    }
    
    var body: some View {
        ProgressView(value: expPercent){
            VStack{
                Text("Experience: \(currentExpLabel) / \(expNeededToLevelLabel)")
            }
        }
    }
}

#Preview {
    let player = GameCharacter.sample
    player.currentExperience = 1
    return ExpBarView(player: player)
}
