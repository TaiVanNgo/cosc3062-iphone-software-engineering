//
//  Item.swift
//  CampusCompass
//
//  Created by Van Tai on 18/9/26.
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
