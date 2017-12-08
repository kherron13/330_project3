//
//  ViewController.swift
//  To Do List Screen
//
//  Created by Chris Huang on 11/19/17.
//  Copyright © 2017 Chris Huang. All rights reserved.
//
//  Followed Brun Philipe's Blog https://www.brunophilipe.com/blog/articles/swift-tutorial-mytodo/ for reference/guidance
//
import UIKit

class ViewController: UITableViewController
{
    private var todoItems = [ToDoItem]()
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        self.title = "To-Do List"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.didTapAddItemButton(_:)))
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(UIApplicationDelegate.applicationDidEnterBackground(_:)),
            name: NSNotification.Name.UIApplicationDidEnterBackground,
            object: nil)
        
        do
        {
            self.todoItems = try [ToDoItem].readFromPersistence()
        }
        catch let error as NSError
        {
            if error.domain == NSCocoaErrorDomain && error.code == NSFileReadNoSuchFileError
            {
                NSLog("File Not Found")
            }
            else
            {
                let alert = UIAlertController(
                    title: "Error",
                    message: "Could not load the to-do items!",
                    preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                NSLog("Error loading from persistence: \(error)")
            }
        }
    }
    
    @objc
    public func applicationDidEnterBackground(_ notification: NSNotification)
    {
        do
        {
            try todoItems.writeToPersistence()
        }
        catch let error
        {
            NSLog("Error writing to persistence: \(error)")
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
    {
        // Create an alert
        let alert = UIAlertController(
            title: "New To-Do Item",
            message: "Add the title of the new to-do item:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:
            { (_) in
                // Get the title the user inserted, but only if it is not an empty string
                if let title = alert.textFields?[0].text, title.characters.count > 0
                {
                    self.addNewToDoItem(title: title)
                }
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    private func addNewToDoItem(title: String)
    {
        // The index of the new item will be the current item count
        let newIndex = todoItems.count
        
        // Creates a new item and add it to the todo items list
        todoItems.append(ToDoItem(title: title))
        
        // Tell the table view a new row has been created
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_todo", for: indexPath)
        
        if indexPath.row < todoItems.count
        {
            let item = todoItems[indexPath.row]
            cell.textLabel?.text = item.title
            
            let accessory: UITableViewCellAccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < todoItems.count
        {
            let item = todoItems[indexPath.row]
            item.done = !item.done
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            // Delete the row from the data source
            todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.todoItems[sourceIndexPath.row]
        todoItems.remove(at: sourceIndexPath.row)
        todoItems.insert(movedObject, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(todoItems)")
        // To check for correctness enable: self.tableView.reloadData()
    }
    
}
