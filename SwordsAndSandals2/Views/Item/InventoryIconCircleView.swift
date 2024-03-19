//
//  InventoryIconCircleView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct InventoryIconCircleView: View {
    
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
    let itemSlot: ItemSlot?
    @State var item: Item?
    @Binding var draggedItem: Item?
    
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
                    if let itemPath = item?.iconImagePath {
                        Image(itemPath)
                    }
                }
        }
        .dropDestination(for: Item.self){ items, location in
            defer {draggedItem = nil}
            guard items.first?.itemSlot == itemSlot else { return false }
            item = items.first
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
        InventoryIconCircleView(itemSlot: .head, draggedItem: .constant(item))
    }
}

