//
//  ItemDetailView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct ItemDetailsView: View {
    
    let item: Item

    var body: some View {
        VStack{
            Text(item.name)
                .font(.largeTitle)
            Text(item.description)
            Divider()
            Image(item.iconImagePath)
            StatsView(stats: item.stats)
                .padding(.horizontal)
            Text("💰 \(item.price)")
        }
        
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.gray).opacity(0.2)
                .shadow(radius: 10)
        }
    }
}

#Preview {
    ItemDetailsView(item: Item.basicSword)
}
