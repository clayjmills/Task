//
//  Task + Convenience.swift
//  TaskiOS11
//
//  Created by Clay Mills on 2/15/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import Foundation
// add a convenience initializer for Task objects
import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String? = nil, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = false 
        
    }
}
