//
//  Counter.swift
//  Week9
//
//  Created by Van Tai on 24/8/26.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    var id = UUID()
    
    var title: String
    var description: String?
    var isDone: Bool = false
}
