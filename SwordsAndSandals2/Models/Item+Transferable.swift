//
//  Item+Transferable.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 3/19/24.
//

import SwiftUI

extension Item: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .item)
    }
}
