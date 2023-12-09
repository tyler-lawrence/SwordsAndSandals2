//
//  LivingCharacter.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation
import SwiftUI

struct LivingCharacter: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .background(
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 20)
                        .opacity(0.5)
                        .blur(radius: 8.0)
                        
                }
            )

    }
}
