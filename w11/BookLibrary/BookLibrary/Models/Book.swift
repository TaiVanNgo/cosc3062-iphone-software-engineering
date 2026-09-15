//
//  Book.swift
//  BookLibrary
//
//  Created by Van Tai on 14/9/26.
//

import Foundation
import SwiftData

@Model
final class Book{
    var title: String
    var isRead: Bool
    var creationDate: Date = Date()
    
    var author: Author?
    
    init(title: String, author: Author? = nil, isRead: Bool = false) {
        self.title = title
        self.author = author
        self.isRead = isRead
    }
}

