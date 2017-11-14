//
//  FlashcardGroup.swift
//  Boost
//  A FlashcardGroup will act as a deck of flashcards
//  Created by Kelly Herron on 11/13/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit

class FlashcardGroup: NSObject, Comparable {
    
    //MARK: Properties
    var title: String
    var group: [Flashcard]
    
    //MARK: Initialization
    init(title: String, flashcards: [Flashcard]) {
        self.title = title
        self.group = flashcards.sorted()
    }
    
    //MARK: Equality and Comparison
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? FlashcardGroup {
            return self.title == other.title
        }
        return false
    }
    
    static func < (lhs: FlashcardGroup, rhs: FlashcardGroup) -> Bool {
        if lhs.title >= rhs.title { return false }
        return true
    }
}
