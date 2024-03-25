//
//  GameState.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import Foundation

enum GameState: Codable {
    case tutorial
    case combat(GameCharacter)
    case main
    case shop
    case healer
    case levelUp
    case transition
    case gameOver
}
