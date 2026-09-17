//
//  Destinations.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI
import SwiftData

struct Destinations: View {
    let destinations: [Destination]
    
    @State var isSettingOpen = false
    
    var body: some View {
        NavigationStack {
            DestinationListView(destinations: destinations)
                .navigationTitle("Destinations")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink{
                            FavoriteView(
                                destinations: destinations
                            )
                        } label: {
                            Image(systemName: "heart")
                                .foregroundStyle(.brandPrimary)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isSettingOpen = true
                        } label: {
                            Image(systemName: "gear")
                                .foregroundStyle(.brandPrimary)
                        }
                    }
                }
                .sheet(isPresented: $isSettingOpen){
                    Settings()
                }
        }
    }
}

#Preview {
    Destinations(
        destinations: destinationData
    )
    .modelContainer(for: FavouriteDestination.self, inMemory: true)
}
