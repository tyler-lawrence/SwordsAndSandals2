//
//  CombatActionView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct CombatActionView: View {
    
    @State var cm: CombatManager
    let combatAction: CombatAction
    let size = 50.0
    let gradient: Gradient = Gradient(colors: [.white, .blue])
    let action: () -> Void
    
    var body: some View {
        Button {
            cm.playerAction = combatAction
            action()
            hapticFeedback(for: combatAction)
        } label: {
            VStack{
                Text(combatAction.icon)
                    .frame(width: size, height: size)
                    .font(.largeTitle)
                    
                Text("\(combatAction.stat.rawValue): \(cm.player.getTotalStat(for: combatAction.stat))")
                        .foregroundColor(.white)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundStyle(
                        .radialGradient(gradient, center: .center, startRadius: 0, endRadius: size)
                    )
                    .shadow(radius: 6)
            )
        }
        .disabled(cm.roundOver)
    }
}

#Preview {
    CombatActionView(cm: CombatManager.testCM, combatAction: .agilityAttack){}
}
