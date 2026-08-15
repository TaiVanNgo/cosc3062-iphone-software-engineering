//
//  ContentView.swift
//  VietnamMap
//
//  Created by Van Tai on 19/7/26.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var selectedCity = "Saigon"
    @State private var mapPos: MapCameraPosition = .automatic
    
    private var selectedLocations: [Location] {
        selectedCity == "Saigon"
            ? saiGonLocations
            : haNoiLocations
    }
    
    var body: some View {
        HeaderView()

        Picker("City", selection: $selectedCity){
            Text("Saigon").tag("Saigon")
            Text("Hanoi").tag("Hanoi")
        }.pickerStyle(.segmented)
        
        MapView(locations: selectedLocations, position: $mapPos)
            .onAppear(){
                updateMapPosition()
            }
            .onChange(of: selectedCity) { _, _ in
                updateMapPosition()
            }
    }
    
    private func updateMapPosition() {
            guard let firstLocation = selectedLocations.first else {
                return
            }

            mapPos = .region(
                MKCoordinateRegion(
                    center: firstLocation.locationCoordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.04,
                        longitudeDelta: 0.04
                    )
                )
            )
        }

}

#Preview {
    HomeView()
}
