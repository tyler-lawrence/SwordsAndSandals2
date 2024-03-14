//
//  InventoryIconCircleView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct InventoryIconCircleView: View {
    let size: CGFloat = 70
    let scale: Double = 1.3
    var color: Color = .gray
    var isHighlighted: Bool = false
    @State var degrees: Double = 360.0
    
    var body: some View {
        ZStack{
            if isHighlighted{
                ZStack {
                    Rectangle()
                        .fill(AngularGradient(gradient: Gradient(colors: [.yellow, .white]), center: .center, angle: .degrees(degrees)))
                        .brightness(0.2)
                        .saturation(0.9)
                        .blur(radius: 3)
                }
                .onAppear {
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        degrees = 0
                    }
                }
                .clipShape(Circle())
                .frame(width: size * scale, height: size * scale)
            }
            Circle()
                .foregroundColor(color)
                .frame(width: size, height: size)
        }
        
    }
}

#Preview {
    VStack{
        InventoryIconCircleView()
        InventoryIconCircleView(isHighlighted: true)
    }
}

