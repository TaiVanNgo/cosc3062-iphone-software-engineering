//
//  Contact.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import Foundation
import SwiftUI
import CoreLocation

struct Contact : Identifiable, Codable {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
