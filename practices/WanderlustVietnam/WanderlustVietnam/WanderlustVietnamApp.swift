//
//  WanderlustVietnamApp.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI
import SwiftData

@main
struct WanderlustVietnamApp: App {
    @AppStorage("theme") var isDarkTheme = false

    var sharedModelContainer: ModelContainer = {
           // Define the schema (the blueprints) for our data
        let schema = Schema([
            FavouriteDestination.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
               fatalError("Could not create ModelContainer: \(error)")
           }
       }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkTheme ? .dark : .light)
        }
        .modelContainer(sharedModelContainer)
    }
}
