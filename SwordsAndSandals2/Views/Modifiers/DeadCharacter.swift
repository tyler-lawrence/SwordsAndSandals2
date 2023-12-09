//
//  DeadCharacter.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation
import SwiftUI

struct DeadCharacter: ViewModifier {
    func body(content: Content) -> some View {
        content
            .offset(x: 70)
            .rotationEffect(.degrees(90), anchor: .center)
            .background(
                VStack{
                    Text("☠️")
                        .font(.system(size: 80))
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.red)
                        .frame(width: 200, height:20)
                        .blur(radius: 6.0)
                }
            )
    }
}
