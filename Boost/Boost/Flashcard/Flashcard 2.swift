//
//  Flashcard.swift
//  Boost
//
//  Created by Kelly Herron on 11/13/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit

class Flashcard: NSObject, Comparable, NSCoding {
    
    //MARK: Properties
    var front: String
    var back: String
    
    //MARK: Types
    struct PropertyKey {
        static let front = "front"
        static let back = "back"
    }
    
    //MARK: Initialization
    init(front: String, back: String) {
        self.front = front
        self.back = back
    }
    
    //MARK: Equality and Comparison
    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Flashcard {
            return self.front == other.front &&
                   self.back == other.back
        }
        return false
    }
    
    static func < (lhs: Flashcard, rhs: Flashcard) -> Bool {
        if lhs.front < rhs.front {
            return true
        } else if lhs.front == rhs.front {
            if lhs.back < rhs.back {
                return true
            }
        }
        return false
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(front, forKey: PropertyKey.front)
        aCoder.encode(back, forKey: PropertyKey.back)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let front = aDecoder.decodeObject(forKey: PropertyKey.front) as? String else {
            return nil
        }
        guard let back = aDecoder.decodeObject(forKey: PropertyKey.back) as? String else {
            return nil
        }
        self.init(front: front, back: back)
    }
}
