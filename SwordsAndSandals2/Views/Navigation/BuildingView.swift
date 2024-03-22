//
//  BuildingView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/21/24.
//

import SwiftUI

struct BuildingView: View {
    
    @Environment(GameManager.self) var gameManager
    let destination: GameState
    let buildingImagePath: String
    let size: CGFloat = 150
    
    var body: some View {
        Button{
            gameManager.gameState = destination
        } label: {
            Image(buildingImagePath)
                .resizable()
                .scaledToFit()
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    BuildingView(destination: .shop, buildingImagePath: "Town1Hut")
        .environment(GameManager.sample)
}
