//
//  Movie.swift
//  week10
//
//  Created by Van Tai on 3/9/26.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String?
    var documentID: String?
}
