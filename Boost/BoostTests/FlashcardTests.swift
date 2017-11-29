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
}
