//
//  Contact.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import Foundation
import CoreLocation
import SwiftUI

struct Contact: Identifiable, Codable {
    let email: String
    let id: Int
    let phone: String
    let imageName: String
    let name: String
    let coordinates: Coordinates
    
    var image: Image {
        Image(imageName)
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}
