//
//  MapView.swift
//  RmitLocations
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    let locations: [CampusLocation]
    
    var body: some View {
        Map(initialPosition: .automatic) {
            ForEach(locations) { loc in
                Annotation(loc.name, coordinate: loc.coordinate) {
                    Image(systemName: loc.iconName)
                        .font(.title2)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.blue)
                        )
                        
                }
                .tag(loc.id)
            }
        }
    }
}

#Preview {
    MapView(
        locations: CampusLocation.saigonLocations
    )
}

