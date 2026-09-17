//
//  TagView.swift
//  ToDoAppSwiftData
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI
import SwiftData


struct TagView: View {
    @Environment(\.modelContext) private var modelContext
    
    let item: ToDoItem
    
    @Query private var tags: [Tag]
    
    @State private var newTagName = ""
    var body: some View {
        VStack{
            List {
                Section("TAP TO ADD/REMOVE"){
                    ForEach(tags) { tag in
                        
                        HStack{
                            Text(tag.name)
                            
                            Spacer()
                            
                            if item.tags.contains(where: {$0.name == tag.name}){
                                Image(systemName: "checkmark")
                            }
                        }
                        .onTapGesture {
                            toggleTag(tag: tag)
                        }
                    }
                    // .onDelete(perform: deleteItems)
                }
            }
            HStack{
                TextField("Create New Tag", text: $newTagName)
                
                Button("Create") {
                    createTag()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    newTagName.trimmingCharacters(
                        in: .whitespaces
                    ).isEmpty
                )
            }
            .padding()
        }
        .navigationTitle("Manage Tags")
    }
    
    private func createTag() {
        let newTag = Tag(name: newTagName)
        
        modelContext.insert(newTag)
    }
//    
//    private func deleteItems(at offsets: IndexSet) {
//        for index in offsets {
//            modelContext.delete(items[index])
//        }
//    }
    
    private func toggleTag(tag: Tag){
        let tagIdx = item.tags.firstIndex { $0.name == tag.name}
        
        if let tagIdx {
            item.tags.remove(at: tagIdx)
        } else {
            item.tags.append(tag)
        }
    }
}




#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    
    let container = try! ModelContainer(for: Tag.self, configurations: config)
    
    let sampleItems: [Tag] = [
        Tag(name: "Currently Doing"),
        Tag(name: "Not Urgent"),
        Tag(name: "Urgent")
    ]
    
    for item in sampleItems {
        container.mainContext.insert(item)
    }
    
    let todoItem = ToDoItem(name: "Todo1", isCompleted: true)
    
    return TagView(
        item: todoItem
    )
        .modelContainer(container)
}
