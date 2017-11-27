//
//  QuizViewController.swift
//  Boost
//
//  Created by Kelly Herron on 11/26/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //shuffle flashcards and present first one
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    
    @IBAction func flipPressed(_ sender: UIBarButtonItem) {
        //display back if front is displayed, front if back is displayed
        textView.text = "Flipped!"
    }
    
    @IBAction func removePressed(_ sender: UIBarButtonItem) {
        //remove card from deck during this quiz session and move on to next card
        print("remove card")
    }
    
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        print("next card")
    }
}
