//
//  Project.swift
//  W11
//
//  Created by Van Tai on 14/9/26.
//

import Foundation
import SwiftData

@Model
final class Project {
    var name: String
    var creationDate: Date
    
    @Relationship(deleteRule: .cascade, inverse: \TodoItem.project)
    var todoItems: [TodoItem] = []
    
    init(name: String, creationDate: Date) {
        self.name = name
        self.creationDate = creationDate
    }
}


extension Project {
    static var samples: [Project] {
        let university = Project(
            name: "University",
            creationDate: .now
        )

        university.todoItems = [
            TodoItem(name: "Finish assignment", timeStamp: .now),
            TodoItem(name: "Review SwiftData", timeStamp: .now)
        ]

        let personal = Project(
            name: "Personal",
            creationDate: .now
        )

        personal.todoItems = [
            TodoItem(name: "Buy groceries", timeStamp: .now),
            TodoItem(name: "Exercise", timeStamp: .now)
        ]

        return [university, personal]
    }
}
