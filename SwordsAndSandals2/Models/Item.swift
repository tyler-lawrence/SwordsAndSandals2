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
    var equippedItemImagePath: String {
        iconImagePath + " - equipped"
    }
}

extension Item {
    //MARK: - Weapons
    static let basicSword = Item(name: "Sword", description: "a used shortsword", iconImagePath: "sword", price: 3, stats: [.agility: 1], itemSlot: .weapon)
    static let dagger = Item(name: "Dagger", description: "stabby mcstab stab", iconImagePath: "dagger", price: 4, stats: [.agility: 1], itemSlot: .weapon)
    static let stick = Item(name: "Stick", description: "just a normal stick", iconImagePath: "stick", price: 3 , stats: [.strength: 1], itemSlot: .weapon)
    static let wand = Item(name: "Wand", description: "abracadabra", iconImagePath: "wand", price:  3, stats: [.magic: 3], itemSlot: .weapon)
    static let glowingSword = Item(name: "Glowing Sword", description: "a sword with a mysterious glow", iconImagePath: "glowing sword", price: 6, stats: [.magic: 3, .agility: 1], itemSlot: .weapon)
    static let windu = Item(name: "Windu", description: "spiky, heavy", iconImagePath: "mace", price: 8, stats: [.strength: 6], itemSlot: .weapon)
    static let sword3 = Item(name: "Sword", description: "a sword made of DnD dice", iconImagePath: "Sword 3", price: 2, stats: [.strength: 10, .agility: 10, .magic: 10], itemSlot: .weapon)
    
    //MARK: - Armor
    static let tShirt = Item(name: "T-shirt", description: "a plain lightweight t-shirt", iconImagePath: "tshirt", price: 1, stats: [.magicResist:1], itemSlot: .torso)
    static let plate = Item(name: "Plate", description: "sturdy plate armor", iconImagePath: "plate", price: 12, stats: [.armor: 7], itemSlot: .torso)
    static let beanie = Item(name: "Beanie", description: "a nice knit beanie to keep your head warm", iconImagePath: "beanie", price: 2, stats: [.strength: 1], itemSlot: .head)
    static let spartanHelmet = Item(name: "Spartan Helmet", description: "definitely not trademarked", iconImagePath: "spartan helmet", price: 12, stats: [.armor: 2], itemSlot: .head)
    static let helmet = Item(name: "Helmet", description: "a pretty standard helmet", iconImagePath: "helmet", price: 3, stats: [.armor: 2], itemSlot: .head)
    static let wizardHat = Item(name: "Wizard Hat", description: "A wizard hat from the days of old", iconImagePath: "wizard hat", price: 6, stats: [.magic: 5], itemSlot: .head)
    static let bunnyEars = Item(name: "Bunny Ears", description: "a cute hat inspired by Bob's Burgers", iconImagePath: "bunny ears", price: 8, stats: [.magic: 7], itemSlot: .head)
    static let devilHorns = Item(name: "Devil Horns", description: "horns of the devil", iconImagePath: "devil horns", price: 6, stats: [.agility: 2, .magic: 2], itemSlot: .head)
}
