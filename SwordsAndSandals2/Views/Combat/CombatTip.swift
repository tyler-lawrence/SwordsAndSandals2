//
//  CombatTip.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/19/24.
//

import SwiftUI
import TipKit

struct CombatTip: Tip {
    var title: Text {
        Text("Press a button to perform an attack")
    }
    
    var message: Text? {
        Text(
            """
            Agility: high accuracy, low damage
            Strength: medium accuracy, medium damage
            Magic: low accuracy, high damage
            """
        )
    }
    
}
