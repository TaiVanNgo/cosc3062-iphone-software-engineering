//
//  Book.swift
//  LibrarySwiftData
//
//  Created by Van Tai on 18/9/26.
//

import Foundation
import SwiftData

@Model
final class Book {
    var title: String
    var author: Author?
    var isRead: Bool
    var createdAt: Date = Date.now
    
    init(
        title: String,
        isRead: Bool
    ) {
        self.title = title
        self.isRead = isRead
    }
}
