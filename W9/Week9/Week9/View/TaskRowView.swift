//
//  TaskRowView.swift
//  Week9
//
//  Created by Van Tai on 24/8/26.
//

//https:api.openweathermap.org/data/2.5/weather?q=ho%20chi%20minh&appid=31d8b90bd8fb5014dd92f16321675c47&units=metric


import SwiftUI

struct TaskRowView: View {
    @Binding var task: TodoItem
    
    var body: some View {
        HStack {
            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isDone ? .green : .black)
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .brandingFont(size: 16, relativeTo: .headline)
                    .foregroundStyle(.red)
                    .strikethrough(task.isDone)
                
                if let description = task.description, !description.isEmpty {
                    Text(description)
                        .font(.custom("PressStart2P", size: 12, relativeTo: .subheadline))
                        .foregroundStyle(.black)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var task = TodoItem(title: "Do chore", description: "clean home,...", isDone: true)
    
    @Previewable @State var undoneTask = TodoItem(title: "Do chore", description: "clean home,...", isDone: false)
    
    VStack{
        TaskRowView(task: $task)
        TaskRowView(task: $undoneTask)
        TaskRowView(task: $undoneTask)
    }
    
}
