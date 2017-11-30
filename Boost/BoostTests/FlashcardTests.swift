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
        
        //get (and verify) initial view controller, FlashcardGroupTableViewController, which is embedded in a navigation controller
        let storyboard = UIStoryboard(name: "Flashcard", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "Flashcard") as? UINavigationController
        XCTAssertNotNil(navigationController)
        let flashcardGroupViewController = navigationController!.topViewController as? FlashcardGroupTableViewController
        XCTAssertNotNil(flashcardGroupViewController)
        
        //view and load sample data, verifying that the tableview contains the expected number of rows
        _ = flashcardGroupViewController!.view
        flashcardGroupViewController?.beginAppearanceTransition(true, animated: false)
        flashcardGroupViewController!.loadSampleFlashcardGroups()
        XCTAssertEqual(2, flashcardGroupViewController!.tableView(flashcardGroupViewController!.tableView, numberOfRowsInSection: 0))
        
        //verfiy that there are visible rows in the table
        let flashcardGroupTableView = flashcardGroupViewController!.tableView
        let visibleFlashcardGroups = flashcardGroupTableView!.indexPathsForVisibleRows
        XCTAssertNotNil(visibleFlashcardGroups)
        
        //"select" the second cell, which is the nonempty deck, and perform segue
        let selectIndex = IndexPath(row: 1, section: 0)
        let flashcardGroupCell = flashcardGroupViewController!.tableView(flashcardGroupTableView!, cellForRowAt: selectIndex)
        flashcardGroupTableView?.selectRow(at: selectIndex, animated: false, scrollPosition: .top)
        //verify that row we want to select is visible
        XCTAssert(visibleFlashcardGroups!.contains(selectIndex))
        flashcardGroupViewController!.performSegue(withIdentifier: "ShowFlashcards", sender: flashcardGroupCell)
    }
}
