//
//  SwordsAndSandals2App.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI
import TipKit

@main
struct SwordsAndSandals2App: App {
    @Environment(\.scenePhase) var scenePhase
    @State private var appManager = AppManager()
    var body: some Scene {
        WindowGroup {
            GameSelectionView()
                .environment(appManager)
                .onChange(of: scenePhase){
                    appManager.save()
                }
                .task {
                    // Configure and load your tips at app launch.
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
