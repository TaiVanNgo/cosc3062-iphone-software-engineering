//
//  Project.swift
//  W11
//
//  Created by Van Tai on 14/9/26.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var name: String
    var timeStamp: Date
    var isCompleted: Bool
    
    var project: Project?
    
    // Many-to-Many relationship
    var tags: [Tag] = []
    
    init(name: String, timeStamp: Date, isCompleted: Bool = false) {
        self.name = name
        self.timeStamp = timeStamp
        self.isCompleted = isCompleted
    }
}
