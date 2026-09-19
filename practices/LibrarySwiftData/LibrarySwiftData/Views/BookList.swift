//
//  BookList.swift
//  LibrarySwiftData
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI
import SwiftData

struct BookList: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Book.createdAt, order: .reverse)
    private var books: [Book]
    
    @State var isOpenAddBookView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    VStack{
                        Text(book.title)
                        
                        Text(book.author?.name ??   "")
                    }

                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("Book Library")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        isOpenAddBookView.toggle()
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isOpenAddBookView){
            NavigationStack{
                AddBookView()
            }
        }
    }
    
    private func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(books[index])
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    

     let schema = Schema([Book.self, Author.self])
     let container = try! ModelContainer(for: schema, configurations: config)
    
    // Setup and insert your sample data:
    let sampleBook: [Book] = [
        Book(title: "Book 1", isRead: false),
        Book(title: "Book 2", isRead: false),
        Book(title: "Book 3", isRead: false)
    ]
    
    for book in sampleBook {
        container.mainContext.insert(book)
    }
    
  return   BookList()
        .modelContainer(
            container
        )
}

