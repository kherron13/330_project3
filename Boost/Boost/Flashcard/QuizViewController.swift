//
//  QuizViewController.swift
//  Boost
//
//  Created by Kelly Herron on 11/26/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import GameplayKit.GKRandomSource

class QuizViewController: UIViewController {
    
    //MARK: Properties
    var flashcards: [Flashcard]!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var removeButton: UIBarButtonItem!
    var frontDisplayed = false
    var currentDisplayedFlashcard: Flashcard!
    var currentIndex = 0
    @IBOutlet weak var cardArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if flashcards.isEmpty {
            fatalError("Unexpected empty flashcard deck found in Quiz")
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.cardTapped(_:)))
        cardArea.addGestureRecognizer(tapGesture)
        
        //shuffle flashcards
        flashcards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: flashcards) as! [Flashcard]
        
        displayFlashcard()
    }
    
    //MARK: Private methods
    
    private func displayFlashcard() {
        currentDisplayedFlashcard = flashcards[currentIndex]
        textView.text = currentDisplayedFlashcard.front
        frontDisplayed = true
    }
    
    private func flipCard() {
        if frontDisplayed {
            textView.text = currentDisplayedFlashcard.back
            frontDisplayed = false
        } else {
            textView.text = currentDisplayedFlashcard.front
            frontDisplayed = true
        }
    }
    
    //MARK: Actions
    
    @objc func cardTapped(_ sender: UITapGestureRecognizer) {
        flipCard()
    }
    
    @IBAction func flipPressed(_ sender: UIBarButtonItem) {
        flipCard()
    }
    
    @IBAction func removePressed(_ sender: UIBarButtonItem) {
        flashcards.remove(at: currentIndex)
        if flashcards.count == 1 { removeButton.isEnabled = false }
        displayFlashcard()
    }
    
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        currentIndex = (currentIndex + 1) % flashcards.count
        displayFlashcard()
    }
}
