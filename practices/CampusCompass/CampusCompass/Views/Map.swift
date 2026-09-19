//
//  Map.swift
//  CampusCompass
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    let spots: [Spot]
    
    @State private var selectedLocationID: Int?
    
    private var selectedSpot: Spot?{
        spots.first { $0.id == selectedLocationID }
    }
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom) {
                Map(initialPosition: .automatic, selection: $selectedLocationID) {
                    ForEach(spots) { spot in
                        Marker(spot.name, systemImage: "mappin", coordinate: spot.coordinate)
                            .tag(spot.id)
                        
                        
                    }
                    
                }
                .mapStyle(.standard(elevation: .realistic))
                .mapControls {
                    MapCompass()
                    MapPitchToggle()
                    MapScaleView()
                }
                    
                if let spot = selectedSpot {
                    NavigationLink {
                        PlaceDetailView(spot: spot)
                    } label: {
                        VStack {
                            Text(spot.name)
                            Text(spot.building)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                    )
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MapView(
        spots: spotsData
    )
}
//
//
//struct MapView: View {
//    var spots: [Spot]
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    Map(spots: spotsData)
//}
