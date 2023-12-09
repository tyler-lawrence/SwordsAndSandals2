//
//  StatStepperView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct StatStepperView: View {
    
    @Binding var player: GameCharacter
    let stat: StatType
    @State var pointsToAdd = 0

    var newScore: Int {
        let originalScore = player.baseStats[stat] ?? 0
        return originalScore + pointsToAdd
    }
    
    var mininumScore: Int {
        player.baseStats[stat] ?? 0
    }

    var body: some View {
        HStack{
            Text(stat.rawValue)
            Spacer()
            Button{
                decrementStat()
            } label: {
                Image(systemName: "arrow.left")
            }
            .buttonStyle(.borderedProminent)
            .disabled(newScore <= mininumScore)
            
            Text("\(newScore)")
                .padding(.horizontal)
            
            Button{
                incrementStat()
            } label: {
                Image(systemName: "arrow.right")
            }
            .buttonStyle(.borderedProminent)
            .disabled(player.skillPointsAvailable == 0)
        }
        .onDisappear{
            player.baseStats[stat] = newScore
        }
    }
    
    func incrementStat(){
        player.skillPointsAvailable -= 1
        pointsToAdd += 1
    }
    
    func decrementStat(){
        player.skillPointsAvailable += 1
        pointsToAdd -= 1
    }
}

#Preview {
    StatStepperView(player: .constant(GameCharacter.sample), stat: .strength)
        
}
