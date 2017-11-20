//
//  FlashcardGroup.swift
//  Boost
//  A FlashcardGroup will act as a deck of flashcards
//  Created by Kelly Herron on 11/13/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit

class FlashcardGroup: NSObject, Comparable, NSCoding {
    
    //MARK: Properties
    var title: String
    var group: [Flashcard]
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("flashcardgroups")
    
    //MARK: Types
    struct PropertyKey {
        static let title = "title"
        static let group = "group"
    }
    
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
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(group, forKey: PropertyKey.group)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String else {
            return nil
        }
        guard let group = aDecoder.decodeObject(forKey: PropertyKey.group) as? [Flashcard] else {
            return nil
        }
        self.init(title: title, flashcards: group)
    }
}
