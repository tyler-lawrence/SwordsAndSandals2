//
//  View+CharacterModifiers.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation
import SwiftUI

extension View {
    func livingCharacter() -> some View {
        modifier(LivingCharacter())
    }
    
    func deadCharacter() -> some View {
        modifier(DeadCharacter())
    }
}
