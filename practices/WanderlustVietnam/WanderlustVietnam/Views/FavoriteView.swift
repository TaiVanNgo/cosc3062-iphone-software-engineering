//
//  FavoriteView.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var favDestinationIDs: [FavouriteDestination]
    
    let destinations: [Destination]
    
    var favDestination: [Destination] {
        destinations.filter { des in
            favDestinationIDs.contains {$0.id == des.id}
        }
    }
    
    var body: some View {
        if favDestination.isEmpty {
            ContentUnavailableView(
                "No Saved Destination",
                systemImage: "bookmark.fill",
                description: Text("Please click on the heart button to save your favourite destinations")
            )
        } else {
            DestinationListView(destinations: favDestination)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)

    let container = try! ModelContainer(for: FavouriteDestination.self, configurations: config)
    
    let sampleItems: [FavouriteDestination] = [
        FavouriteDestination(id: 1001),
        FavouriteDestination(id: 1002)
    ]
    
    for item in sampleItems {
        container.mainContext.insert(item)
    }
    
    return FavoriteView(destinations: destinationData)
        .modelContainer(container)
}
