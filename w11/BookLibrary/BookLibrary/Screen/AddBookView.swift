//
//  AddBookView.swift
//  BookLibrary
//
//  Created by Van Tai on 14/9/26.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Query(sort: \Author.name)
    private var authors: [Author]
    
    // Form input states
    @State private var newBookName = ""
    @State private var selectedAuthorName: String?
    @State private var newAuthorName = ""
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Enter Book's Name", text: $newBookName)
                } header: {
                    Text("Book Details")
                }
                
                Section{
                    Picker("Author", selection: $selectedAuthorName) {
                        Text("Select Author")
                            .tag(nil as String?)
                        
                        ForEach(authors) { author in
                            Text(author.name)
                                .tag(author.name as String?)
                        }
                    }
                } header: {
                    Text("Select An Author")
                }
                
                Section {
                    TextField("Enter Author's Name", text: $newAuthorName)
                } header: {
                    Text("Or Add a New Author")
                }
                
            }
            .navigationTitle("Add New Book")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveItem()
                        dismiss()
                    }
                    .disabled(
                        newBookName.trimmingCharacters(in: .whitespaces)
                            .isEmpty
                    )
                }
            }
        }
        
    }
    
    private func saveItem() {
        let trimmedBookTitle = newBookName.trimmingCharacters(in: .whitespaces)
        
        guard !trimmedBookTitle.isEmpty else {
            return
        }
        
        let trimmedAuthorName = newAuthorName.trimmingCharacters(in: .whitespaces)
        
        var finalAuthor: Author?
        
        if !trimmedAuthorName.isEmpty {
            // if we can find the author in the list
            if let existingAuthor = authors.first(
                where: { $0.name == trimmedAuthorName}
            ) {
                finalAuthor = existingAuthor
            } else {
                // if we can't find the author in the list -> create new author
                let newAuthor = Author(name: trimmedAuthorName)
                modelContext.insert(newAuthor)
                finalAuthor = newAuthor
            }
        } else if let selectedAuthorName {
            finalAuthor = authors.first(where: {
                $0.name == selectedAuthorName
            })
        }
        
        let newBook = Book(title: trimmedBookTitle, author: finalAuthor)
        
        modelContext.insert(newBook)
    }
    
}

#Preview {
    AddBookView()
        .modelContainer(for: Author.self, inMemory: true)
}
