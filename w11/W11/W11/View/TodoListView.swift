//
//  TodoListView.swift
//  W11
//
//  Created by Van Tai on 14/9/26.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    
    let project: Project
    
    @State private var newTodoTitle = ""
    
    var body: some View {
        VStack{
            List {
                ForEach(project.todoItems) { item in
                    HStack {
                        Image(
                            systemName: item.isCompleted ? "checkmark.circle.fill" : "circle"
                        )
                        .foregroundStyle(.green)
                        .onTapGesture {
                            item.isCompleted.toggle()
                            
                        }
                        NavigationLink{
                            ManageTagsView(todoItem: item)
                        } label: {
                            VStack(alignment: .leading){
                                Text(item.name)

                                if !item.tags.isEmpty{
                                    HStack{
                                        ForEach(item.tags){ tag in
                                            Text(tag.name)
                                                .font(.caption)
                                                .padding(4)
                                                .background(.gray.opacity(0.5))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
                .onDelete(perform: deleteItems)
            }
           
            HStack{
                TextField("New To-Do item", text: $newTodoTitle)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    addItem()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle(project.name)
    }
    
    
    private func addItem() {
        let newTodoItem = TodoItem(name: newTodoTitle, timeStamp: .now)
        
        project.todoItems.append(newTodoItem)
        newTodoTitle = "" //reset
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(project.todoItems[index])
        }
    }
}

#Preview {
    NavigationStack{
        TodoListView(project: Project(name: "Title 1", creationDate: .now)
        )
        .modelContainer(
            for:  Project.self,
            inMemory: true
        )
    }
    
}
