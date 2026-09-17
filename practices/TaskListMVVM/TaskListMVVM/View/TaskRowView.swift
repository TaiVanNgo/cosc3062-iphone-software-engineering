//
//  TaskRowView.swift
//  TaskListMVVM
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

struct TaskRowView: View {
    var task: ToDoItem
    
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(.green)
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                
                if let description = task.description, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                }
            }
            .strikethrough(task.isDone)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    List{
        TaskRowView(
            task: (ToDoItem(title: "Task1", description: "This is description"))
        )
        TaskRowView(
            task: (ToDoItem(title: "Task2", description: "This is description", isDone: true))
        )
    }
    
}
