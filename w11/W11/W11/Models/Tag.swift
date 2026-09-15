
//
//  Project.swift
//  W11
//
//  Created by Van Tai on 14/9/26.
//

import Foundation
import SwiftData

@Model
final class Tag {
    @Attribute(.unique)
    var name: String
    
    @Relationship(inverse: \TodoItem.tags)
    var items: [TodoItem] = []
    
    init(name: String) {
        self.name = name
    }
}
