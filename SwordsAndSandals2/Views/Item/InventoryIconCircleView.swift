//
//  InventoryIconCircleView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct InventoryIconCircleView: View {
    let frameSize: CGFloat = 70
    var color: Color = .blue
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(0.2)
            .frame(width: frameSize, height: frameSize)
    }
}

#Preview {
    InventoryIconCircleView()
}

