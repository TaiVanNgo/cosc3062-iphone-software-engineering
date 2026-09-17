//
//  ToDoItem.swift
//  TodoAppMVVM
//
//  Created by Van Tai on 17/9/26.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String?
    var isDone = false
}

extension ToDoItem {
    static let samples = [
        ToDoItem(
            title: "Task 1", description: "Task 1 Description"
        ),
        ToDoItem(
            title: "Task 2", description: "Task 2 Description"
        ),
        ToDoItem(
            title: "Task 3", description: "Task 3 Description", isDone: true
        )
    ]
}
