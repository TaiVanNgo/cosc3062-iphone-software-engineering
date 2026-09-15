//
//  ProjectListView.swift
//  W11
//
//  Created by Van Tai on 14/9/26.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Project.creationDate, order: .reverse) private var projects: [Project]
    
    @State private var projectName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(projects) { project in
                        NavigationLink {
                            TodoListView(project: project)
                        } label: {
                            Text(project.name)
                        }
                    }
                    .onDelete(perform: deleteProject)
                }
                
                HStack {
                    TextField("New Project Name", text: $projectName)
                    
                    Button("Add") {
                        addProject()
                    }
                    .disabled(projectName.isEmpty)
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Project List")
        }
    }
    
    private func addProject() {
        let newProject = Project(name: projectName, creationDate: .now)
        
        modelContext.insert(newProject)
        
        projectName = "" //reset the name
    }
    
    private func deleteProject(offsets: IndexSet) {
        for index in offsets {
             let projectToDelete = projects[index]
            
            modelContext.delete(projectToDelete)
        }
    }
}

#Preview {
    ProjectListView()
        .modelContainer(for: Project.self, inMemory: true)
}
