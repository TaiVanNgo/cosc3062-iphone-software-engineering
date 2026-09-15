//
//  Author.swift
//  BookLibrary
//
//  Created by Van Tai on 14/9/26.
//

import Foundation
import SwiftData

@Model
final class Author {
    @Attribute(.unique)
    var name: String
    
     @Relationship(inverse: \Book.author)
     var books: [Book] = []

    init(name: String) {
        self.name = name
    }
}
