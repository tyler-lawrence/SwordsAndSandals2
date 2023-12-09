//
//  StatsView.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/9/23.
//

import SwiftUI

struct StatsView: View {
    let stats: StatDictionary
    var presentStatTypes: [StatType] {
        Array(stats.keys)
    }
    var body: some View {
        VStack{
            Text("Stats:")
            ForEach(presentStatTypes, id: \.self) { statType in
                if let stat = stats[statType] {
                    HStack{
                        Text("\(statType.rawValue):")
                        Spacer()
                        Text("\(stat)")
                    }
                }
            }
        }
    }
}

#Preview {
    StatsView(stats: [.magic : 1, .strength: 1])
}
