//
//  CombatView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI
import TipKit

struct CombatView: View {
    
    @State var timeElapsed = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    enum CurrentAnimation: Int {
        case neither
        case enemy
        case player
    }
    
    @State var appManager: AppManager
    @Environment(GameManager.self) var gameManager
    @State var cm: CombatManager
    
    var currentAnimation: CurrentAnimation {
        if timeElapsed >= 20 {
            return .enemy
        } else if timeElapsed > 0{
            return .player
        } else {
            return .neither
        }
    }
    
    var body: some View {
        ZStack{
            
            VStack {
                
                // Action bar
                HStack{
                    Spacer()
                    ForEach(CombatAction.allCases, id:\.self){ combatAction in
                        CombatActionView(cm: cm, combatAction: combatAction){
                            cm.processRound()
                            timeElapsed = 40
                        }
                        .disabled(currentAnimation != .neither)
                        Spacer()
                    }
                }
                .padding()
                .background(Rectangle().foregroundStyle(.bar))
                TipView(CombatTip(), arrowEdge: .top)
                
                Spacer()
                
                // Characters
                HStack{
                    
                    ZStack{
                        CharacterCombatView(character: cm.player)
                        
                        if currentAnimation == .player {
                            DamageView(damage: cm.playerDamageTaken)
                        }
                    }
                    
                    Spacer()
                    
                    ZStack{
                        CharacterCombatView(character: cm.enemy)
                        if currentAnimation == .enemy {
                            DamageView(damage: cm.enemyDamageTaken)
                        }
                    }
                }
                .padding()
                Spacer()
            }
            if cm.gameOver {
                GameOverView(appManager: appManager, player: cm.player)
            }
            if cm.roundOver {
                if let combatResult = cm.result {
                    PostCombatView(result: combatResult, enemyName: cm.enemy.name)
                }
            }
        }
        .onReceive(timer){_ in
            if cm.roundOver {
                timeElapsed = 40
            } else {
                timeElapsed -= 2
            }
        }
    }
}

#Preview {
    CombatView(appManager: AppManager.sample, cm: CombatManager.testCM)
}
