//
//  test.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct Test: View {
    // 1. Maintain a state representing the backstack
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                // 2. NavigationLink emits a value, not a destination view
                NavigationLink("User Details", value: "user_42")
                NavigationLink("Settings ID", value: 99)
            }
            .navigationTitle("Dashboard")
            // 3. Map data types to their corresponding views lazily
            .navigationDestination(for: String.self) { userID in
                Text("Showing Profile: \(userID)")
            }
            .navigationDestination(for: Int.self) { settingID in
                Text("Setting #\(settingID)")
            }
        }
    }
}

#Preview {
    Test()
}
