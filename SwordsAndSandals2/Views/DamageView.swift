//
//  DamageView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct DamageView: View {
    let damage: Int?
    var attackHit: Bool {
        guard damage != nil else { return false }
        return true
    }
    var hitDisplayText: String {
        if let damage {
            return "- \(damage)"
        } else {
            return ""
        }
    }
    var body: some View {
        if attackHit{
            Image("Blood Splatter")
                .overlay(
                    Text(hitDisplayText)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                )
        } else {
            Image("Miss")
                .overlay(
                    Text("Miss")
                )
        }
    }
}

#Preview {
    DamageView(damage: 1)
}

#Preview {
    DamageView(damage: 10)
}

#Preview {
    DamageView(damage: nil)
}
