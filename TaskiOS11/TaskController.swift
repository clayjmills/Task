//
//  TaskController.swift
//  TaskiOS11
//
//  Created by Clay Mills on 2/15/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    init() {
        tasks = fetchTasks()
    }
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        saveToPersistentStorage()
        tasks = fetchTasks()
        
    }
    func update(task: Task, name: String, notes: String?, due: Date?) {
        saveToPersistentStorage()
        tasks = fetchTasks()
        
    }
    func remove(task: Task) {
        saveToPersistentStorage()
        tasks = fetchTasks()
        
    }
    func saveToPersistentStorage() {
        
    }
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
        
    }
}
var tasks: [Task] = []
}
