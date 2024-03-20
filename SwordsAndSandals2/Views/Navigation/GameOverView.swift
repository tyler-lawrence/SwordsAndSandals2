//
//  GameOverView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct GameOverView: View {
    @State var appManager: AppManager
    let player: GameCharacter
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var frameSize: CGFloat = 1000
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle() // destination
                    .ignoresSafeArea()
                Circle()    // source
                    .blur(radius: 10.0)
                    .frame(width: frameSize, height: frameSize)
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
            .onReceive(timer) { _ in
                if frameSize > 5{
                    frameSize -= 3
                } else {
                    showingAlert = true
                }
            }
            .alert("gameOver", isPresented: $showingAlert){
                Button("Play Again"){
                    guard let currentGameManager = appManager.selectedGame else { return }
                    appManager.remove(gameManager: currentGameManager)
                    appManager.appState = .setup
                }
            }
        }
        .onAppear{
            playSound(sound: "death", type: "mp3")
        }
        
    }
}

#Preview {
    GameOverView(appManager: AppManager.sample, player: GameCharacter.sample)
}
