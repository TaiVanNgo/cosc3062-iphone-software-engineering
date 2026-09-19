//
//  Spots.swift
//  CampusCompass
//
//  Created by Van Tai on 18/9/26.
//

import Foundation
import CoreLocation

struct Spot: Codable, Identifiable {
    let id: Int
    let name: String
    let category: String
    let building: String
    let summary: String
    let description: String
    let hours: String
    let symbol: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
}
