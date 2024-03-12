//
//  Item.swift
//  TinderClone
//
//  Created by User on 12/03/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
