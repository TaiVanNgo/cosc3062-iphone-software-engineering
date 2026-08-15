//
//  Location.swift
//  VietnamMap
//
//  Created by Van Tai on 19/7/26.
//

import Foundation
import CoreLocation
import SwiftUI

struct Location : Identifiable {
    var id: UUID = UUID()
    var name: String
    var iconName: String
    var locationCoordinate: CLLocationCoordinate2D

    var icon: Image{
        Image(systemName: iconName)
    }
}
