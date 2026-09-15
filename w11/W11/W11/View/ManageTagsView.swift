//
//  ManageTagsView.swift
//  W11
//
//  Created by Van Tai on 14/9/26.
//

import SwiftUI
import SwiftData

struct ManageTagsView: View {
    @Environment(\.modelContext) private var modelContext
    
    let todoItem: TodoItem
    
    @Query(sort: \Tag.name) private var allTags: [Tag]
    
    @State private var newTagName = ""
    
    var body: some View {
        VStack{
            List{
                Section("Tap to Add/Remove") {
                    ForEach(allTags) { tag in
                        Button {
                            toggle(tag: tag)
                        } label: {
                            HStack{
                                Text(tag.name)
                                Spacer()
                                if todoItem.tags.contains(where: {
                                    $0.id == tag.id
                                }) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            
            
            HStack{
                TextField("Create tag name", text: $newTagName)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    createTag()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Manage Tags")
    }
    
    private func createTag(){
        let newTag = Tag(name: newTagName)
        modelContext.insert(newTag)
        newTagName = ""
    }
    
    private func toggle(tag: Tag){
        if let index = todoItem.tags.firstIndex(where: {
            $0.id == tag.id
        }) {
            todoItem.tags.remove(at: index)
        } else {
            todoItem.tags.append(tag)
        }
    }
}

#Preview {
    ManageTagsView(
        todoItem: TodoItem(name: "Todo 1", timeStamp: .now)
    )
        .modelContainer(for: Tag.self, inMemory: true)
}
