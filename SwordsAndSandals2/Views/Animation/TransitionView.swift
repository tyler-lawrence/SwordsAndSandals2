//
//  TransitionView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct TransitionView: View {
    
    @Environment(GameManager.self) var gameManager
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var frameSize: CGFloat = 0
    
    var body: some View {
        ZStack {
            Rectangle() // destination
                .foregroundColor(.black)
                .ignoresSafeArea()
            Circle()    // source
                .blur(radius: 10.0)
                .frame(width: frameSize, height: frameSize)
                .blendMode(.destinationOut)
        }
        .compositingGroup()
        .onReceive(timer){ _ in
            if frameSize < 1000 {
                frameSize += 9
            } else {
                gameManager.gameState = .town
            }
            
        }
    }
}

#Preview {
    TransitionView()
        .environment(GameManager.sample)
}
