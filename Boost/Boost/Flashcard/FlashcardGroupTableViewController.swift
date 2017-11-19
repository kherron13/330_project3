//
//  FlashcardGroupTableViewController.swift
//  Boost
//
//  Created by Kelly Herron on 11/14/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit

class FlashcardGroupTableViewController: UITableViewController {
    
    //MARK: Properties
    var flashcardGroups = [FlashcardGroup]()
    var manuallySelected = false
    var lastSelectedIndex: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //suppoort editing flashcard groups in table
        navigationItem.leftBarButtonItem = editButtonItem
        
        //Load sample data
        loadSampleFlashcardGroups()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = lastSelectedIndex {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flashcardGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FlashcardGroupTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FlashcardGroupTableViewCell else { fatalError("The dequeued cell is not an instance of FlashcardGroupTableViewCell.")
        }
        
        let flashcardGroup = flashcardGroups[indexPath.row]
        
        cell.titleLabel.text = flashcardGroup.title
        cell.countLabel.text = "\(flashcardGroup.group.count) cards"
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            flashcardGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let fgDetailViewController = segue.destination as? FlashcardTableViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedFlashcardGroupCell = sender as? FlashcardGroupTableViewCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        let indexPath: IndexPath! = manuallySelected ? IndexPath(row: 0, section: 0) : tableView.indexPath(for: selectedFlashcardGroupCell)
        
        guard indexPath != nil else {
            fatalError("The selected cell is not being displayed by the table")
        }
        manuallySelected = false
        
        lastSelectedIndex = indexPath
        
        let selectedFlashcardGroup = flashcardGroups[indexPath.row]
        fgDetailViewController.flashcardGroup = selectedFlashcardGroup
    }
 
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        //adapted from: https://www.simplifiedios.net/ios-dialog-box-with-input/
        //TODO: disable enter button if empty string
        let alert = UIAlertController(title: "Add Deck", message: "Enter the name of the new deck", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Enter", style: .default) {
            (_) in
            let name = alert.textFields?[0].text
            self.flashcardGroups.insert(FlashcardGroup(title: name!, flashcards: [Flashcard]()), at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
            self.manuallySelected = true
            self.performSegue(withIdentifier: "ShowFlashcards", sender: self.tableView(self.tableView, cellForRowAt: indexPath))
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alert.addTextField{ (textField) in
            textField.placeholder = "Enter Name"
        }
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Private Methods
    private func loadSampleFlashcardGroups() {
        flashcardGroups = [
            FlashcardGroup(title: "Empty", flashcards: []),
            FlashcardGroup(title: "Sample", flashcards: [
                Flashcard(front: "Sample", back: "definition of sample could go here"),
                Flashcard(front: "Sample 2", back: "information about sample 2")])
        ]
    }

}
