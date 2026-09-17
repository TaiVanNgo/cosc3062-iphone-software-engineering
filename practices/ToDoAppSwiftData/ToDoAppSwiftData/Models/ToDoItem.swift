//
//  ToDoItem.swift
//  ToDoAppSwiftData
//
//  Created by Van Tai on 17/9/26.
//

import Foundation

import SwiftData

@Model
final class ToDoItem {
    // Unique identifier (Optional: SwiftData provides an internal persistent `id` automatically)
    // @Attribute(.unique) var id: UUID = UUID()
    
    var name: String
    var isCompleted: Bool
    var createdAt: Date = Date.now

    var project: Project?
    var tags: [Tag] = []
    
    init(
        name: String,
        isCompleted: Bool
    ) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
