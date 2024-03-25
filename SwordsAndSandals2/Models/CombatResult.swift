//
//  CombatResult.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/25/24.
//

import Foundation
import SwiftUI

enum CombatResult: String {
    case victory = "Victory"
    case defeat = "Defeat"
    
    var header: String {
        switch self {
        case .victory:
            "You defeated "
        case .defeat:
            "You return to town with 2 health after your loss against "
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .victory:
                .green
        case .defeat:
                .yellow
        }
    }
}
