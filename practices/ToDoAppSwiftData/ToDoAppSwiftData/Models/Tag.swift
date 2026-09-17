//
//  Tags.swift
//  ToDoAppSwiftData
//
//  Created by Van Tai on 17/9/26.
//

import Foundation
import SwiftData

@Model
final class Tag {
     @Attribute(.unique)
    var name: String
    
    @Relationship(inverse: \ToDoItem.tags)
     var items: [ToDoItem] = []
    
    init(
        name: String,
    ) {
        self.name = name
    }
}
