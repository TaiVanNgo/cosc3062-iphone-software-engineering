//
//  TaskListItemViewMOdel.swift
//  TodoAppMVVM
//
//  Created by Van Tai on 17/9/26.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class TaskListViewModel {
    // MARK: - State Properties
    var taskLists: [ToDoItem]
    
    init(tasks: [ToDoItem] = []){
        self.taskLists = tasks
    }
    
    // MARK: - Intent / Actions
    func addTask(title: String, description: String?){
        let task = ToDoItem(title: title, description: description)
        
        taskLists.append(task)
    }
    
    func deleteTask(at offsets: IndexSet) {
        taskLists.remove(atOffsets: offsets)
    }
    
    func toggleTaskDone(at index: Int){
        taskLists[index].isDone.toggle()
    }
}

