//
//  TaskListMVVMApp.swift
//  TaskListMVVM
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

@main
struct TaskListMVVMApp: App {
    @State var viewModel = TaskListViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
