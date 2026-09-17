//
//  Location.swift
//  RmitLocations
//
//  Created by Van Tai on 15/9/26.
//

import Foundation
import SwiftUI
import CoreLocation

struct CampusLocation: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let coordinate: CLLocationCoordinate2D
    
    var image: Image {
        Image(systemName: iconName)
    }
}

extension CampusLocation{
    static let saigonLocations: [CampusLocation] = [
        CampusLocation(
            name: "Notre-Dame Cathedral",
            iconName: "building.columns.fill",
            coordinate: CLLocationCoordinate2D(latitude: 10.7798, longitude: 106.6990)
        ),
        CampusLocation(
            name: "Independence Palace",
            iconName: "building.columns.fill",
            coordinate: CLLocationCoordinate2D(latitude: 10.7770, longitude: 106.6953)
        ),
        CampusLocation(
            name: "War Remnants Museum",
            iconName: "building.columns.fill",
            coordinate: CLLocationCoordinate2D(latitude: 10.7794, longitude: 106.6922)
        ),
        CampusLocation(
            name: "Ben Thanh Market",
            iconName: "bag.fill",
            coordinate: CLLocationCoordinate2D(latitude: 10.7725, longitude: 106.6980)
        ),
        CampusLocation(
            name: "Bitexco Financial Tower",
            iconName: "building.2.fill",
            coordinate: CLLocationCoordinate2D(latitude: 10.7716, longitude: 106.7044)
        )
    ]
    
    static let hanoiLocations: [CampusLocation] = [
        CampusLocation(
            name: "Imperial Citadel of Thang Long",
            iconName: "building.columns.fill",
            coordinate: CLLocationCoordinate2D(latitude: 21.0366, longitude: 105.8402)
        ),
        CampusLocation(
            name: "One Pillar Pagoda",
            iconName: "mountain.2.fill",
            coordinate: CLLocationCoordinate2D(latitude: 21.0358, longitude: 105.8335)
        ),
        CampusLocation(
            name: "Temple of Literature",
            iconName: "building.columns.circle.fill",
            coordinate: CLLocationCoordinate2D(latitude: 21.0278, longitude: 105.8355)
        ),
        CampusLocation(
            name: "Hanoi Old Quarter",
            iconName: "house.fill",
            coordinate: CLLocationCoordinate2D(latitude: 21.0345, longitude: 105.8505)
        ),
        CampusLocation(
            name: "Hoan Kiem Lake",
            iconName: "water.waves",
            coordinate: CLLocationCoordinate2D(latitude: 21.0287, longitude: 105.8523)
        )
    ]
}
