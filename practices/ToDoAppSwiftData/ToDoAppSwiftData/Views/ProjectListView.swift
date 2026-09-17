//
//  ProjectListView.swift
//  ToDoAppSwiftData
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Project.createdAt, order: .forward)
    private var projects: [Project]
    
    @State private var newProjectName = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 0){
                List {
                    ForEach(projects) { project in
                        NavigationLink {
                            TodoListView(
                                project: project
                            )
                        } label: {
                            Text(project.name)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("Project List")
                
                
                HStack(spacing: 12) {
                    TextField("New Project Name...", text:$newProjectName)
                    
                    Button("Add") {
                        addItem()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(newProjectName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()
                .background(.bar)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }

    private func addItem() {
        let newProj = Project(name: newProjectName)
        modelContext.insert(newProj)
    }

    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(projects[index])
        }
    }
}

#Preview {
    ProjectListView()
        .modelContainer(
            for: Project.self,
            inMemory: true
        )
}
