//
//  TaskListViewModel.swift
//  Week9
//
//  Created by Van Tai on 24/8/26.
//

import Foundation
//import Combine
import SwiftUI
import Observation

@Observable
class TaskListViewModel {
    var tasks: [TodoItem] = []
    var filterText = ""
    
    var key = "taskList"
    
    init(){
        loadTasks()
    }
    
    func addTask(title: String, description: String?){
        let newTask = TodoItem(title: title, description: description)
        tasks.append(newTask)
        saveTasks()
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    func toggleTaskDone(at index: Int){
        tasks[index].isDone.toggle()
        saveTasks()
    }
    
    private func saveTasks(){
        if let encodedData = try? JSONEncoder().encode(tasks){
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
    private func loadTasks(){
        if let savedData = UserDefaults.standard.data(forKey: key){
            if let decodedData = try? JSONDecoder().decode([TodoItem].self, from: savedData) {
                tasks = decodedData
            }
        }
    }
    
}


//class TaskListViewModel: ObservableObject{
//    @Published var tasks: [TodoItem] = []
//    
//    var key = "taskList"
//    
//    init(){
//        loadTasks()
//    }
//    
//    func addTask(title: String, description: String?){
//        let newTask = TodoItem(title: title, description: description)
//        tasks.append(newTask)
//        saveTasks()
//    }
//    
//    func deleteTask(at offsets: IndexSet) {
//        tasks.remove(atOffsets: offsets)
//        saveTasks()
//    }
//    
//    func toggleTaskDone(at index: Int){
//        tasks[index].isDone.toggle()
//        saveTasks()
//    }
//    
//    private func saveTasks(){
//        if let encodedData = try? JSONEncoder().encode(tasks){
//            UserDefaults.standard.set(encodedData, forKey: key)
//        }
//    }
//    
//    private func loadTasks(){
//        if let savedData = UserDefaults.standard.data(forKey: key){
//            if let decodedData = try? JSONDecoder().decode([TodoItem].self, from: savedData) {
//                tasks = decodedData
//            }
//        }
//    }
//    
//}
