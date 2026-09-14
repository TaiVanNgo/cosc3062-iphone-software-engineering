//
//  TripListView.swift
//  W11
//
//  Created by Van Tai on 13/9/26.
//

import SwiftUI
import SwiftData

struct TripListView: View {
    @Query(sort: \Trip.startDate, order: .reverse) var trips: [Trip]
    
    var body: some View {
        List(trips) { trip in
            VStack(alignment: .leading) {
                Text(trip.name)
                    .font(.headline)
                Text(trip.destination)
            }
        }
    }
}

#Preview {
    TripListView()
        .modelContainer(for: Trip.self, inMemory: true)
}
