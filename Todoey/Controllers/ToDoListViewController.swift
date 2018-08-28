//
//  ViewController.swift
//  Todoey
//
//  Created by Mike Gilhooly on 8/27/18.
//  Copyright © 2018 Jack Gilhooly. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    
    
var itemArray = [Item]()
    let defaults = UserDefaults.standard
        override func viewDidLoad() {
    
            super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //if let items = defaults.array(forKey: "toDoListArray") as? [String] {
    //itemArray = items
    let newItem = Item()
    newItem.title = "Swipe to delete me"
    itemArray.append(newItem)
    
    let newItem2 = Item()
    newItem2.title = "Swipe to delete me"
    itemArray.append(newItem2)
    
    let newItem3 = Item()
    newItem3.title = "Swipe to delete me"
    itemArray.append(newItem3)
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else  {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
   
        }

        
        
        
        
        
        
        
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else  {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK- Add Items
    
    @IBAction func addbuttonpressed(_ sender: Any) {
    
    var textfield = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           
            let newitem = Item()
            
            self.itemArray.append(textfield.text!)
            self.defaults.set(self.itemArray, forKey: "toDoListArray")
            self.tableView.reloadData()
            
        }

        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ("Create New Item")
            textfield = alertTextField
          
        }
        
        alert.addAction(action)
        
present(alert, animated: true, completion: nil)
        
    }
    

    



