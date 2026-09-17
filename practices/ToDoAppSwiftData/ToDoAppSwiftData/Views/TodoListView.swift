//
//  ProjectListView.swift
//  ToDoAppSwiftData
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    
    let project: Project
    
    @State private var newTodoItemName = ""
    
    var body: some View {
        VStack{
            List {
                ForEach(project.items) { item in
                    NavigationLink {
                        TagView(item: item)
                    } label: {
                        HStack{
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            
                            VStack{
                                Text(item.name)
                                    .strikethrough(item.isCompleted)
                                
                                HStack{
                                    ForEach(item.tags) { tag in
                                        Text(tag.name)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(.gray)
                                            )
                                    }
                                }
                            }
                            
                        }
                        
                    }
                }
                .onDelete(perform: deleteItems)
            }
         
            HStack{
                TextField("Add New Todo List", text: $newTodoItemName)
                
                Button("Add") {
                    addItem()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    newTodoItemName.trimmingCharacters(
                        in: .whitespaces
                    ).isEmpty
                )
            }
            .padding()
        }
        .navigationTitle("Todo List")
    }
    
    private func addItem() {
        let newItem = ToDoItem(name: newTodoItemName, isCompleted: false)
        project.items.append(newItem)
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let deletedItem = project.items[index]
            modelContext.delete(deletedItem)
        }
    }
}

#Preview {
    
    let project = Project(name: "Preview Project")
    
    project.items = [
        ToDoItem(name: "Todo1", isCompleted: false),
        ToDoItem(name: "Todo2", isCompleted: true)
    ]
    
    return NavigationStack{
        TodoListView(
            project: project
        )
        .modelContainer(
            for: ToDoItem.self,
            inMemory: true
        )
        
    }
}

