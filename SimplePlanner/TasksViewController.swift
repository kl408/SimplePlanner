//
//  TasksViewController.swift
//  SimplePlanner
//
//  Created by Michelle Cheng on 5/7/21.
//

import UIKit
import Parse

class TasksViewController: UIViewController {
  
    
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var taskField: UITextField!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func create(_ sender: Any) {
        let task = PFObject(className: "Tasks")
        task["content"] = taskField.text!
        task["dueDate"] = dateField.text!
        task["owner"] = PFUser.current()!
        
        if let text = taskField.text, text.isEmpty{
            self.dismiss(animated: true, completion: nil)
        } else {
            task.saveInBackground { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("saved!")
                } else{
                    print("error!")
                }
            }
        }
    }
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatePicker()
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        dateField.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle = .wheels
        dateField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        dateField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
