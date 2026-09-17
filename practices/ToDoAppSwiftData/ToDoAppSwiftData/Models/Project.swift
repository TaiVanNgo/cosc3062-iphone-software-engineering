//
//  Project.swift
//  ToDoAppSwiftData
//
//  Created by Van Tai on 17/9/26.
//

import Foundation
import SwiftData

@Model
final class Project {
    var name: String
    var createdAt: Date = Date.now
    
    @Relationship(deleteRule: .cascade, inverse: \ToDoItem.project)
     var items: [ToDoItem] = []
    
    init(
        name: String
    ) {
        self.name = name
    }
}
