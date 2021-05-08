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
        
        task.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else{
                print("error!")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
