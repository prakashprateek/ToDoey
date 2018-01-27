//
//  ViewController.swift
//  ToDoey
//
//  Created by Prateek Prakash on 1/27/18.
//  Copyright © 2018 TSSP. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Have Fun", "Play Ball", "Do Work:-)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    
}

