//
//  AddView.swift
//  LibrarySwiftData
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    // Parent query for relationship picker
    @Query private var authors: [Author]
    
    // Form input states
    @State private var newBookTitle: String = ""
    @State private var selectedAuthor: String = ""
    @State private var newAuthorName: String = ""
    
    var body: some View {
        Form {
            Section ("BOOK DETAILS"){
                TextField("Enter book name here...", text: $newBookTitle)
            }
            
            Section("SELECT AN AUTHOR") {
                Picker("Select Author", selection: $selectedAuthor) {
                    Text("Author").tag(nil as String?)
                    
                    ForEach(authors) { a in
                        Text(a.name).tag(a.name)
                    }
                }
            }
//            
            Section("OR ADD A NEW AUTHOR") {
                TextField("Enter author name here...", text: $newAuthorName)
            }
        }
        .navigationTitle("Add New Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    createBook(authorName: selectedAuthor)
                    dismiss()
                }
            }
        }
    }
    
    private func createBook(authorName: String) {
        let newBook = Book(title: newBookTitle, isRead: false)
        modelContext.insert(newBook)

        if selectedAuthor.isEmpty {
            // create new author
            let newAuthor = Author(name: newAuthorName)
            
            newAuthor.books.append(newBook)
            modelContext.insert(newAuthor)
        } else {
            let existedAuthor = authors.first {$0.name == authorName}
            
            if let existedAuthor{
                existedAuthor.books.append(newBook)
            }
        }
    }
}

#Preview {
    NavigationStack{
        AddBookView()
            .modelContainer(for: [Book.self, Author.self], inMemory: true)
    }
}
