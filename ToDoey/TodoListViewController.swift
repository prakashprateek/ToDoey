//
//  ViewController.swift
//  ToDoey
//
//  Created by Prateek Prakash on 1/27/18.
//  Copyright © 2018 TSSP. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Have Fun", "Play Ball", "Do Work:-)"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String]{
            itemArray = items
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Number of rows in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }

    // populate the cells in the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // MARK - Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
     
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var newItem = UITextField()
        
        let alert = UIAlertController(title: "Add new To Do Item", message: "What would you like to do next?", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // code to add the new item to item array
            print("success")
            //print(newItem.text as Any)
            if let newTask = newItem.text {
                if newTask.isEmpty != true {
                    self.itemArray.append(newTask)
                    print(self.itemArray[self.itemArray.count-1])
                    self.defaults.set(self.itemArray, forKey: "ToDoListArray")
                    self.tableView.reloadData()
                }
            } else {
                print("no user input!")
            }
        }
        
        
        alert.addAction(action)
        
        alert.addTextField { (inputTextField) in
            //
            //self.itemArray.append((inputTextField.text))
            inputTextField.placeholder = "Create New Item"
            //print(inputTextField.text as Any)
            newItem = inputTextField
            
        }
        
       // alert.addTextField(configurationHandler: <#T##((UITextField) -> Void)?##((UITextField) -> Void)?##(UITextField) -> Void#>)
      
        present(alert, animated: true, completion: nil)
        
    }
    
}

