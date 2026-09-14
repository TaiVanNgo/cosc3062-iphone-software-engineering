//
//  Models.swift
//  W11
//
//  Created by Van Tai on 13/9/26.
//

import Foundation
import SwiftData

@Model
class BucketListItem {
    var title: String
    var hasBeenCompleted = false
    var trip: Trip? // A to-one relationship to a Trip
    
    init(title: String) {
        self.title = title
    }
}

@Model
class Trip {
    @Attribute(.unique) var name: String
    var destination: String
    var startDate: Date
    var endDate: Date
    
    @Relationship(deleteRule: .cascade) var bucketList: [BucketListItem] = []
    
    init(name: String, destination: String, startDate: Date, endDate: Date){
        self.name = name
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
    }
}
