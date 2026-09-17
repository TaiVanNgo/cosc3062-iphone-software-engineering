//
//  ToDoAppSwiftDataApp.swift
//  ToDoAppSwiftData
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppSwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        // Define the schema (the blueprints) for our data
        let schema = Schema([
            Project.self,
            ToDoItem.self,
            Tag.self,
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
            ProjectListView()
                .modelContainer(sharedModelContainer)
        }
    }
}
