//
//  Item.swift
//  HorizonMaps
//

import Foundation
import SwiftData

@Model
final class Item {
    // Default value for CloudKit sync compatibility.
    var timestamp: Date = Date.now
    
    init(timestamp: Date = .now) {
        self.timestamp = timestamp
    }
}
