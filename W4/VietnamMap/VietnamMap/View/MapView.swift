//
//  MapView.swift
//  VietnamMap
//
//  Created by Van Tai on 19/7/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    var locations: [Location]
    @Binding var position: MapCameraPosition
    
    var body: some View {
        Map(position: $position){
            ForEach(locations) { location in
                Annotation(
                    location.name,
                    coordinate: location.locationCoordinate
                ){
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.blue)
                        .frame(width: 40, height:40)
                        .overlay{
                            location.icon
                        }
                }
            }
        }
    }
}

#Preview {
    MapView(locations: haNoiLocations, position: .constant(.automatic))
}
