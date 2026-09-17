//
//  ContentView.swift
//  TaskListMVVM
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(TaskListViewModel.self) var viewModel
    
    @State var newTaskTitle = ""
    @State var newTaskDescription = ""
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        NavigationStack {
            List {
                ForEach(viewModel.taskLists.indices, id: \.self) { index in
                    Button{
                        viewModel.toggleTaskDone(at: index)
                    } label: {
                        TaskRowView(task: viewModel.taskLists[index])
                    }
                    .buttonStyle(.plain)
                }
                .onDelete(perform: viewModel.deleteTask)
                
            }
            .navigationTitle("Task List")
            .navigationBarTitleDisplayMode(.large)
            
            HStack {
                VStack{
                    TextField("New Task Title", text: $newTaskTitle)
                    TextField("New Task Description", text: $newTaskDescription)
                }
                                
                Button("Add"){
                    viewModel.addTask(title: newTaskTitle, description: newTaskDescription)
                    
                    newTaskTitle = ""
                    newTaskDescription = ""
                }
            }
            .padding()

        }
        .onAppear{
            let newTask = ToDoItem.samples[0]
            viewModel.addTask(title: newTask.title, description: newTask.description)
        }
    }
}

#Preview {
    @Previewable @State var viewModel = TaskListViewModel()
    
    ContentView()
        .environment(viewModel)
}
