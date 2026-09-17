//
//  ContentView.swift
//  RmitLocations
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

enum RmitCampus: String, CaseIterable, Identifiable, Codable {
    case saigon = "Saigon"
    case hanoi = "Hanoi"
    
    var id: String { self.rawValue }
    
    var locations: [CampusLocation] {
        switch self{
        case .saigon:
            return CampusLocation.saigonLocations
        case .hanoi:
            return CampusLocation.hanoiLocations
        }
    }
}


struct ContentView: View {
    @State private var selectedCampus = RmitCampus.saigon
    
    var body: some View {
        VStack {
            HStack(spacing: 4){
                Text("RMIT")
                    .foregroundStyle(.red)
                Text("Locations")
                    .foregroundStyle(.blue)
            }
            .font(.largeTitle)
            .fontWeight(.light)
            
            Picker("Select Campus", selection: $selectedCampus) {
                ForEach(RmitCampus.allCases) { campus in
                    Text(campus.rawValue)
                        .tag(campus)
                }
            }
            .padding(.horizontal)
            .pickerStyle(.segmented)

            MapView(locations: selectedCampus.locations)

        }
    }
}

#Preview {
    ContentView()
}
