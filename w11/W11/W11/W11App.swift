//
//  W11App.swift
//  W11
//
//  Created by Van Tai on 9/9/26.
//

import SwiftUI
import SwiftData

@main
struct W11App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Trip.self, BucketListItem.self])
    }
}
