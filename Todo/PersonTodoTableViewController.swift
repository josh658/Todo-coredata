//
//  PersonTodoTableViewController.swift
//  Todo
//
//  Created by Cambrian on 2023-06-21.
//

import UIKit
import CoreData

class PersonTodoTableViewController: UITableViewController {

    var todos: [Todo] = []
    var container: NSPersistentContainer!
    var person: Person!
    
    @IBAction func addTodo(_ sender: Any) {
        let alert = UIAlertController(title: "new ToDo", message: "what is the ToDo", preferredStyle: .alert)
        
        let alertActionOK = UIAlertAction(title: "Add", style: .default) {
            _ in
            
            let textField = alert.textFields![0]
            
            let toDo = Todo(context: self.container.viewContext)
            toDo.title = textField.text
            toDo.isComplete = Int.random(in: 0...1) == 1
            
            self.person.addToTodos(toDo)
        }
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField(){ textField in
            textField.placeholder = "ToDo Name"
        }
        
        alert.addAction(alertActionCancel)
        alert.addAction(alertActionOK)
        
        
        
        self.present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todos = person.todos!.allObjects as! [Todo]
        todos = todos.sorted { t1, t2 in
            return t1.title! < t2.title!
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return person.todos!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personTodoCell", for: indexPath)

        // Configure the cell...
//        cell.textLabel!.text = "test"
        cell.textLabel!.text = todos[indexPath.row].title

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
