//
//  BookLibraryApp.swift
//  BookLibrary
//
//  Created by Van Tai on 14/9/26.
//

import SwiftUI
import SwiftData

@main
struct BookLibraryApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Book.self,
            Author.self
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
            BookListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
