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
    var lastSelectedIndex: IndexPath?
    weak var actionToEnable: UIAlertAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //suppoort editing flashcard groups in table
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedFlashcardGroups = loadFlashcardGroups() {
            FlashcardContainerSingleton.sharedDataContainer.flashcardGroups += savedFlashcardGroups
        } else {
            loadSampleFlashcardGroups()
        }
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
        return FlashcardContainerSingleton.sharedDataContainer.flashcardGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FlashcardGroupTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FlashcardGroupTableViewCell else { fatalError("The dequeued cell is not an instance of FlashcardGroupTableViewCell.")
        }
        
        let flashcardGroup = FlashcardContainerSingleton.sharedDataContainer.flashcardGroups[indexPath.row]
        
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
            FlashcardContainerSingleton.sharedDataContainer.flashcardGroups.remove(at: indexPath.row)
            FlashcardContainerSingleton.sharedDataContainer.saveFlashcardGroups(viewController: self)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
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
        
        let indexPath: IndexPath! = tableView.indexPathForRow(at: selectedFlashcardGroupCell.center)
        
        guard indexPath != nil else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        lastSelectedIndex = indexPath
        
        let selectedFlashcardGroup = FlashcardContainerSingleton.sharedDataContainer.flashcardGroups[indexPath.row]
        fgDetailViewController.flashcardGroup = selectedFlashcardGroup
    }
 
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        //adapted from https://www.simplifiedios.net/ios-dialog-box-with-input/
        //and https://stackoverflow.com/questions/24474762/check-on-uialertcontroller-textfield-for-enabling-the-button
        let alert = UIAlertController(title: "Add Deck", message: "Enter the name of the new deck", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Enter", style: .default) {
            (_) in
            let name = alert.textFields?[0].text
            FlashcardContainerSingleton.sharedDataContainer.flashcardGroups.insert(FlashcardGroup(title: name!, flashcards: [Flashcard]()), at: 0)
            FlashcardContainerSingleton.sharedDataContainer.saveFlashcardGroups(viewController: self)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
            self.performSegue(withIdentifier: "ShowFlashcards", sender: self.tableView(self.tableView, cellForRowAt: indexPath))
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alert.addTextField{ (textField) in
            textField.placeholder = "Enter Name"
            textField.addTarget(self, action: #selector(self.textChanged(_:)), for: .editingChanged)
            textField.autocapitalizationType = .words
            textField.autocorrectionType = .yes
        }
        
        alert.addAction(confirmAction)
        self.actionToEnable = confirmAction
        confirmAction.isEnabled = false
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Private and Internal Methods
    @objc private func textChanged(_ sender: UITextField) {
        actionToEnable?.isEnabled = sender.text! != ""
    }
    
    internal func loadSampleFlashcardGroups() { //needs to be internal so it can be accessed for tests
        FlashcardContainerSingleton.sharedDataContainer.flashcardGroups = [
            FlashcardGroup(title: "Empty", flashcards: []),
            FlashcardGroup(title: "Sample Deck", flashcards: [
                Flashcard(front: "sample", back: "a small part of anything or one of a number, intended to show the quality, style, or nature of the whole"),
                Flashcard(front: "example", back: "an instance serving for illustration"),
                Flashcard(front: "Boost", back: "a productivity app for students developed by Team Bits of String"),
                Flashcard(front: "flaschard", back: "a card having words, numerals, or pictures on it, designed for gaining a rapid response from pupils when held up briefly by a teacher, used especially in reading, arithmetic, or vocabulary drills."),
                Flashcard(front: "productivity", back: "the quality, state, or fact of being able to generate, create, enhance, or bring forth goods and services")])
        ]
    }
    
    private func loadFlashcardGroups() -> [FlashcardGroup]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: FlashcardGroup.ArchiveURL.path) as? [FlashcardGroup]
    }
}
