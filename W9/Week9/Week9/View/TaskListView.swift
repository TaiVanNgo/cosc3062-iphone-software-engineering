//
//  TaskListView.swift
//  Week9
//
//  Created by Van Tai on 24/8/26.
//

import SwiftUI

struct TaskListView: View {
    @Environment(TaskListViewModel.self) var viewModel
    
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        NavigationStack{
            List{
                HStack{
                    TextField("New task Title", text: $taskTitle)
                        .brandingFont(size: 12)
                        
                    TextField("New task description", text: $taskDescription)
                        .brandingFont(size: 12)
                    
                    Button {
                        viewModel.addTask(
                            title: taskTitle,
                            description: taskDescription
                        )
                    } label: {
                        Text("Add")
                            .brandingFont(size: 12)
                    }
                    .disabled(taskTitle.isEmpty)
                }
                
                ForEach(viewModel.tasks.indices, id: \.self) { index in
                    Button(action: {
                        viewModel.toggleTaskDone(at: index)
                    }) {
                        TaskRowView(task: $viewModel.tasks[index])
                            .animation(
                                .easeOut(duration: 0.3),
                                value: viewModel.tasks[index].isDone
                            )
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
            .navigationTitle("Tasks")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar { EditButton() }
//            .searchable(text: $viewModel.task, prompt: "FIlter Tasks")
        }
        
    }
}

#Preview {
    TaskListView()
        .environment(TaskListViewModel())
}
