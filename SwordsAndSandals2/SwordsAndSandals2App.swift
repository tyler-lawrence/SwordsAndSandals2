//
//  SwordsAndSandals2App.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import SwiftUI

@main
struct SwordsAndSandals2App: App {
    @State private var appManager = AppManager()
    var body: some Scene {
        WindowGroup {
            GameSelectionView()
                .environment(appManager)
        }
    }
}
