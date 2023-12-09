//
//  TownView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct TownView: View {
    @Environment(GameManager.self) var gameManager
    var player: GameCharacter {
        gameManager.player
    }
    var body: some View {
        VStack{
            HStack {
                PlayerSummaryView()
                    .environment(player)
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    TownView()
        .environment(GameManager.sample)
}
