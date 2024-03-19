//
//  InventoryTip.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/19/24.
//

import Foundation
import TipKit

struct InventoryTip: Tip {
    var title: Text {
        Text("Press and hold to pick up an item from your bag")
    }
    
    var message: Text? {
        Text("Drop an item over a glowing box")
    }
    
}
