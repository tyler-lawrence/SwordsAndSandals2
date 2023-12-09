//
//  HealthBarView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct HealthBarView: View {
    @State var character: GameCharacter
    let frameHeight: CGFloat = 10
    let frameWidth: CGFloat = 100
    var healthRemainingPercent: Double {
        Double(character.currentHealth) / Double(character.maxHealth)
    }
    var currentHealthFrameWidth: CGFloat {
        max(0, frameWidth * CGFloat(healthRemainingPercent))
    }
    var body: some View {
        withAnimation(.easeIn){
            ZStack(alignment: .leading){
                Capsule()
                    .foregroundStyle(.gray)
                    .frame(width: frameWidth, height: frameHeight)
                Capsule()
                    .foregroundStyle(.red)
                    .frame(width: currentHealthFrameWidth, height: frameHeight)
            }
        }
    }
}

#Preview {
    VStack{
        HealthBarView(character: GameCharacter.sample)
        HealthBarView(character: GameCharacter.sampleDeadCharacter)
        HealthBarView(character: GameCharacter.sampleInjuredCharacter)
    }
}
