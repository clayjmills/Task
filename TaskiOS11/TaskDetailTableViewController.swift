//
//  TaskDetailTableViewController.swift
//  TaskiOS11
//
//  Created by Clay Mills on 2/15/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        updateTask()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDueTextField: UITextField!
    
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDueTextField.inputView = dueDateValue
        updateViews()
        
    }
    func updateTask() {
        guard let name = taskNameTextField.text else { return }
        let due = dueDateValue
        let notes = taskNotesTextView.text
        
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
    }
    func updateViews() {
        guard let task = task, isViewLoaded else {return}
        
        title = task.name
        taskNameTextField.text = task.name
        taskDueTextField.text = (task.due as Date?)?.stringValue()
        taskNotesTextView.text = task.notes
    }
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDateValue: Date?
    
    
}
