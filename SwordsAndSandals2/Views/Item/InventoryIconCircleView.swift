//
//  InventoryIconCircleView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct InventoryIconCircleView: View {
    @Environment(GameCharacter.self) var player
    let size: CGFloat = 70
    let highlightScale: Double = 1.3
    var highlightSize: Double {
        size * highlightScale
    }
    var color: Color = .gray
    var isHighlighted: Bool {
        draggedItem?.itemSlot == itemSlot
    }
    @State var degrees: Double = 360.0
    let itemShape = RoundedRectangle(cornerRadius: 10)
    let itemSlot: ItemSlot
    @Binding var draggedItem: Item?
    var imagePath: String {
        player.inventory.itemPath(for: itemSlot) ?? ""
    }
    
    var body: some View {
        ZStack{
            if isHighlighted{
                ZStack {
                    itemShape
                        .fill(AngularGradient(gradient: Gradient(colors: [.yellow, .clear, .clear]), center: .center, angle: .degrees(degrees)))
                        .blur(radius: 1)
                    
                }
                .onAppear {
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        degrees = 0
                    }
                }
                .clipShape(itemShape)
                .frame(width:highlightSize, height: highlightSize)
            }
            itemShape
                .foregroundColor(color)
                .frame(width: size, height: size)
                .overlay{
                    Image(imagePath)
                }
        }
        .dropDestination(for: Item.self){ items, location in
            defer {draggedItem = nil}
            guard let item = items.first else { return false }
            guard item.itemSlot == itemSlot else { return false }
            player.inventory.equip(item, at: itemSlot)
            return true
        }
    }
}

#Preview {
    let item = Item.basicSword
    return VStack{
        ItemInventoryView(item: item)
            .draggable(item)
        InventoryIconCircleView(itemSlot: .weapon, draggedItem: .constant(item))
            .environment(GameCharacter.sample)
        InventoryIconCircleView(itemSlot: .head, draggedItem: .constant(item))
            .environment(GameCharacter.sample)
    }
}

