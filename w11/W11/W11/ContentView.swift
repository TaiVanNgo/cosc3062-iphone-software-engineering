//
//  ContentView.swift
//  W11
//
//  Created by Van Tai on 9/9/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack{
            TripListView()
            
            Button("Add Trip") {
                addTrip()
            }
            .buttonStyle(.borderedProminent)
        }
        
    }
    
    private func addTrip() {
        let newTrip = Trip(name: "Summer Vacation", destination: "The U.S", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 7))
        
        modelContext.insert(newTrip)
    }
    
    private func updateTrip(trip: Trip){
        trip.destination = "Maui"
    }
    
    private func deleteTrip(trip: Trip){
        modelContext.delete(trip)
    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
