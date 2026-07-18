//
//  Contact.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import Foundation
import SwiftUI
import CoreLocation

struct Contact : Identifiable{
    var id: UUID = UUID()
    var name: String
    var email: String
    var phone: String
    var imageName: String
    
    var image: Image{
        Image(imageName)
    }
    
    var locationCoordinate: CLLocationCoordinate2D
}
