//
//  LevelUpAnimation.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation
import SwiftUI

struct LevelUpAnimation: View {
    
    var player: GameCharacter
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State private var expBarVal = 0.0
    @State private var circleFrameVal: CGFloat = 300
    @State private var timeElapsed: Double = 0.0
    
    @Binding var showingAnimation: Bool
    
    var body: some View {
        
        ZStack {
            CharacterView(character: player)
            Circle()
                .trim(from: 0, to: expBarVal)
//                .stroke(player.bodyColor, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: circleFrameVal, height: circleFrameVal)
                .rotationEffect(.init(degrees: -90))
        }
        .onReceive(timer){_ in
            timeElapsed += 0.01
            if expBarVal <= 1 {
                expBarVal += 0.015
            } else {
                circleFrameVal += 10
            }
            if timeElapsed > 1.5 {
                showingAnimation = false
            }
        }
        .onAppear{
            playSound(sound: "LevelUp", type: "mp3")
        }
    }
}

#Preview {
    LevelUpAnimation(player: GameCharacter.sample, showingAnimation: .constant(true))
}
