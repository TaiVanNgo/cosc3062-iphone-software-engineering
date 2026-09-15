//
//  BookListView.swift
//  BookLibrary
//
//  Created by Van Tai on 14/9/26.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var books: [Book]
    
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationStack {
            if books.isEmpty {
                ContentUnavailableView(
                    "No Book Yet",
                    systemImage: "book.closed",
                    description: Text("Tap the + button to add your first book.")
                )
            }
            
            List {
                ForEach(books) { book in
                    Button {
                        book.isRead.toggle()
                    } label: {
                        HStack{
                            Image(
                                systemName: book.isRead
                                    ? "checkmark.circle.fill"
                                    : "circle"
                            )
                            .foregroundStyle(.green)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .fontWeight(.semibold)
                                
                                Text(book.author?.name ??
                                "N/A")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                        }
                    }
                    .buttonStyle(.plain)
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Book Library")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingAddView) {
            AddBookView()
        }
    }
    
    private func deleteBooks(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(books[index])
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    
    let container = try! ModelContainer(for: Book.self, configurations: config)
    
    let authorA = Author(name: "Author A")
    let authorB = Author(name: "Author B")
    
    let sampleItems: [Book] = [
        Book(title: "Book A", author: authorA),
        Book(title: "Book B", author: authorB)
    ]
    
    container.mainContext.insert(authorA)
    container.mainContext.insert(authorB)
    
    for item in sampleItems {
        container.mainContext.insert(item)
    }
    
    return BookListView()
        .modelContainer(container)
}
