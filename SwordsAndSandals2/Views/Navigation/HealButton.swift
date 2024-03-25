//
//  HealButton.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/25/24.
//

import SwiftUI

struct HealButton: View {
    
    @Environment(GameCharacter.self) var player
    let buttonSize: CGFloat = 100.0
    let service: HealerService
    @State var showingAlert: Bool = false
    
    var alertMessage: String {
        "Buy \(service.rawValue) for 💰\(service.cost)?"
    }
    
    enum HealerService: String {
        case full = "full heal"
        case five = "+5 health"
        
        var imageName: String {
            switch self {
            case .full:
                "arrow.clockwise.heart"
            case .five:
                "arrow.up.heart"
            }
        }
        
        var cost: Int {
            switch self {
            case .five:
                5
            case .full:
                10
            }
        }
        
    }
    var body: some View {
        Button{
            showingAlert = true
        } label: {
            VStack{
                Image(systemName: service.imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.red)
                    .frame(width: buttonSize, height: buttonSize)
                Text("💰\(service.cost)")
                    .font(.largeTitle)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10).foregroundStyle(Material.bar)
            )
        }
        .disabled(player.gold < service.cost)
        .alert(alertMessage, isPresented: $showingAlert){
            Button("Cancel", role: .cancel){}
            Button("Buy", role: .destructive){
                switch service {
                case .full:
                    player.currentHealth = player.maxHealth
                case .five:
                    player.currentHealth = min(player.currentHealth+5, player.maxHealth)
                }
                player.gold -= service.cost
            }
        }
    }
}

#Preview {
    HealButton(service: .full)
        .environment(GameCharacter.sample)
}
