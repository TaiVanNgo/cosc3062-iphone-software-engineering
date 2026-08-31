//
//  Week9App.swift
//  Week9
//
//  Created by Van Tai on 24/8/26.
//

import SwiftUI

@main
struct TodoListApp: App {
    @State private var viewModel = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(viewModel)
        }
    }
}
