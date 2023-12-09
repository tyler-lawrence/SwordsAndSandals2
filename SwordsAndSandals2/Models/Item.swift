//
//  Item.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import Foundation

struct Item: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    var iconImagePath: String
    var price: Int
    let stats: StatDictionary
    let itemSlot: ItemSlot
}

extension Item {
    static let basicSword = Item(name: "Sword", description: "a used shortsword", iconImagePath: "sword", price: 3, stats: [.agility: 1], itemSlot: .weapon)
}
