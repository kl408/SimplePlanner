//
//  FeedViewController.swift
//  SimplePlanner
//
//  Created by Michelle Cheng on 4/28/21.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Tasks")
        //filters tasks so users can only see their own tasks
        query.whereKey("owner", equalTo: PFUser.current()!)
        query.includeKey("owner")
        query.findObjectsInBackground { (tasks, error) in
            if tasks != nil{
                self.tasks = tasks!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    //delete tasks
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            let objectId = task.value(forKeyPath: "objectId") as! String
            print(objectId)
            
            let query = PFQuery(className:"Tasks")
            
            query.getObjectInBackground(withId: objectId) { (object, error) -> Void in
                if object != nil && error == nil{
                    //Delete the object from Parse
                    object!.deleteInBackground()
                }
              }
            
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell") as! TasksCell
        let task = tasks[indexPath.row]
        cell.dateLabel.text = task["dueDate"] as? String
        cell.taskLabel.text = task["content"] as! String
        
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
        delegate.window?.rootViewController = loginViewController
    }
}
