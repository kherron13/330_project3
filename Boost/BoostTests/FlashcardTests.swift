//
//  FlashcardTests.swift
//  BoostTests
//
//  Created by Kelly Herron on 11/13/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import XCTest
@testable import Boost

class FlashcardTests: XCTestCase {
    
    var flashcards = [Flashcard]()
    
    override func setUp() {
        super.setUp()
        flashcards = [
            Flashcard(front: "A", back: "A"),
            Flashcard(front: "A", back: "B"),
            Flashcard(front: "B", back: "A"),
            Flashcard(front: "B", back: "B"),
            Flashcard(front: "A", back: "A")
        ]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFlashcardEquals() {
        XCTAssertEqual(flashcards[0], flashcards[4])
        XCTAssertEqual(flashcards[0], flashcards[0])
        XCTAssertNotEqual(flashcards[0], flashcards[1])
    }
    
    func testFlashcardComparisons() {
        XCTAssertGreaterThan(flashcards[1], flashcards[0])
        XCTAssertLessThan(flashcards[0], flashcards[3])
        XCTAssertGreaterThanOrEqual(flashcards[1], flashcards[0])
        XCTAssertGreaterThanOrEqual(flashcards[0], flashcards[4])
        XCTAssertLessThanOrEqual(flashcards[0], flashcards[1])
        XCTAssertLessThanOrEqual(flashcards[0], flashcards[4])
    }
    
    func testViewControllers() { //go through testable navigation to verify that it's working
        
        var currentViewController: UIViewController!
        var nextViewController: UIViewController!
        var currentTableView: UITableView!
        
        //get initial view controller, FlashcardGroupTableViewController, which is embedded in a navigation controller
        let storyboard = UIStoryboard(name: "Flashcard", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Flashcard") as! UINavigationController
        currentViewController = navigationController.topViewController
        
        //"view" and load sample data, verifying that the tableview contains the expected number of rows
        currentViewController.beginAppearanceTransition(true, animated: false)
        (currentViewController as! FlashcardGroupTableViewController).loadSampleFlashcardGroups()
        currentTableView = (currentViewController as! FlashcardGroupTableViewController).tableView
        XCTAssertEqual(2, (currentViewController as! FlashcardGroupTableViewController).tableView(currentTableView, numberOfRowsInSection: 0))
        
        //verfiy that there are visible rows in the table
        let visibleFlashcardGroups = currentTableView.indexPathsForVisibleRows
        XCTAssertNotNil(visibleFlashcardGroups)
        
        //"select" the second cell, which is the nonempty deck
        let selectIndex = IndexPath(row: 1, section: 0)
        let flashcardGroupCell = currentTableView.cellForRow(at: selectIndex)
        //verify that row we want to select is visible
        XCTAssert(visibleFlashcardGroups!.contains(selectIndex))
        
        //navigate to next scene using the selected cell
        nextViewController = storyboard.instantiateViewController(withIdentifier: "SelectedDeck")
        currentViewController.prepare(for: UIStoryboardSegue(identifier: "ShowFlashcards", source: currentViewController, destination: nextViewController), sender: flashcardGroupCell)
        navigationController.pushViewController(nextViewController, animated: false)
        currentViewController = nextViewController
        currentViewController.beginAppearanceTransition(true, animated: false)
       
        //verify properties of FlashcardTableViewController
        XCTAssert(navigationController.topViewController is FlashcardTableViewController)
        XCTAssertEqual((currentViewController as! FlashcardTableViewController).flashcardGroup.title, "Sample Deck")
        currentTableView = (currentViewController as! FlashcardTableViewController).tableView
        XCTAssertEqual(5, (currentViewController as! FlashcardTableViewController).tableView(currentTableView, numberOfRowsInSection: 0))
        XCTAssert((currentViewController as! FlashcardTableViewController).quizButton.isEnabled)
        
        //add new flashcard
        nextViewController = storyboard.instantiateViewController(withIdentifier: "AddFlashcard")
        currentViewController.prepare(for: UIStoryboardSegue(identifier: "AddItem", source: currentViewController, destination: nextViewController), sender: nil)
        currentViewController = (nextViewController as! UINavigationController).topViewController
        currentViewController.beginAppearanceTransition(true, animated: false)
        XCTAssertEqual(currentViewController.navigationItem.title, "New Flashcard")
        
        //cancel add and verify that we are back at the FlashcardTableViewController
        (currentViewController as! FlashcardViewController).cancel(UIBarButtonItem())
        currentViewController = navigationController.topViewController
        XCTAssert(currentViewController is FlashcardTableViewController)
        
        //verify that we can navigate to quiz
        nextViewController = storyboard.instantiateViewController(withIdentifier: "Quiz")
        currentViewController.prepare(for: UIStoryboardSegue(identifier: "Quiz", source: currentViewController, destination: nextViewController), sender: nil)
        navigationController.pushViewController(nextViewController, animated: false)
        currentViewController = nextViewController
        currentViewController.beginAppearanceTransition(true, animated: false)
        XCTAssert(currentViewController is QuizViewController)
        
        //go to next flashcard, remove until one remaining, and verify that user cannot remove it
        (currentViewController as! QuizViewController).nextPressed(UIBarButtonItem())
        for _ in 1...4 {
            XCTAssert((currentViewController as! QuizViewController).removeButton.isEnabled)
            (currentViewController as! QuizViewController).removePressed(UIBarButtonItem())
        }
        XCTAssert(!(currentViewController as! QuizViewController).removeButton.isEnabled)
        
        //go back
        navigationController.popViewController(animated: false)
        currentViewController = navigationController.topViewController
        XCTAssert(currentViewController is FlashcardTableViewController)
        
        //verify visible cells, select the second one
        let visibleFlashcards = currentTableView.indexPathsForVisibleRows
        XCTAssertNotNil(visibleFlashcards)
        let flashcardCell = currentTableView.cellForRow(at: selectIndex)
        XCTAssert(visibleFlashcards!.contains(selectIndex))
        
        //navigate to editing scene
        nextViewController = storyboard.instantiateViewController(withIdentifier: "EditFlashcard")
        currentViewController.prepare(for: UIStoryboardSegue(identifier: "ShowDetail", source: currentViewController, destination: nextViewController), sender: flashcardCell)
        navigationController.pushViewController(nextViewController, animated: false)
        currentViewController = nextViewController
        currentViewController.beginAppearanceTransition(true, animated: false)
        
        //verify properties of FlashcardViewController
        XCTAssert(navigationController.topViewController is FlashcardViewController)
        XCTAssertEqual(currentViewController.navigationItem.title, "example")
        XCTAssertEqual((currentViewController as! FlashcardViewController).frontTextField.text, "example")
        XCTAssertEqual((currentViewController as! FlashcardViewController).backTextView.text, "an instance serving for illustration")
    }
}
