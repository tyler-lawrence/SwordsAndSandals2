//
//  ViewNavigator.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/20/24.
//

import SwiftUI

struct ViewNavigator: View {
    @State var appManager: AppManager
    var body: some View {
        switch appManager.appState {
        case .setup:
            GameSelectionView()
                .environment(appManager)
        case .playing:
            ContentView()
                .environment(appManager.selectedGame)
        }
    }
}

#Preview {
    ViewNavigator(appManager: AppManager.sample)
}
