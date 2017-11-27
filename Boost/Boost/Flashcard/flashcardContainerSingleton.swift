//
//  flashcardContainerSingleton.swift
//  Boost
//
//  Created by Kelly Herron on 11/26/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//  modified from: https://github.com/DuncanMC/SwiftDataContainerSingleton
//  makes persisting changes in data from FlashcardGroup- and FlashcardTableViewController simpler

import UIKit

class FlashcardContainerSingleton {
    static let sharedDataContainer = FlashcardContainerSingleton()
    
    var flashcardGroups = [FlashcardGroup]()
    
    func saveFlashcardGroups(viewController: UIViewController) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(flashcardGroups, toFile: FlashcardGroup.ArchiveURL.path)
        if !isSuccessfulSave {
            let alert = UIAlertController(title: "Error", message: "Flaschards failed to save.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Enter", style: .default))
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
