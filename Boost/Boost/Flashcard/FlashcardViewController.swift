//
//  FlashcardViewController.swift
//  Boost
//
//  Created by Kelly Herron on 11/17/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    //MARK: Properties
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var frontTextField: UITextField!
    @IBOutlet weak var backTextView: UITextView!
    var flashcard: Flashcard?
    var validFront = false
    var validBack = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add Done button on top of keyboard
        frontTextField.inputAccessoryView = createToolbar()
        backTextView.inputAccessoryView = createToolbar()
        
        //register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //notification for text field did change
        NotificationCenter.default.addObserver(self, selector: #selector(self.textFieldDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        
        frontTextField.delegate = self
        backTextView.delegate = self
        
        if let flashcard = flashcard {
            navigationItem.title = flashcard.front
            frontTextField.text = flashcard.front
            validFront = true
            backTextView.text = flashcard.back
            validBack = true
        }
        
        updateSaveButtonEnabled()
    }
    
    //MARK: Private functions
    private func updateSaveButtonEnabled() {
        saveButton.isEnabled = validFront && validBack
    }
    
    private func createToolbar() -> UIToolbar {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar.barStyle = UIBarStyle.blackTranslucent
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toolBarDoneButtonPressed(button:)))
        toolBar.items = [flexibleSpace, doneButton]
        return toolBar
    }
    
    //MARK: UITextViewDelegate and UITextFieldDelegate
    func textViewDidChange(_ textView: UITextView) {
        validBack = !backTextView.text.isEmpty
        updateSaveButtonEnabled()
    }
    
    @objc func textFieldDidChange(_ sender: Notification) {
        validFront = frontTextField.text! != ""
        updateSaveButtonEnabled()
    }
    
    //MARK: Keyboard Management
    @objc func keyboardWillBeShown(_ sender: Notification) {
        //scroll so text is not hidden by keyboard
        var spaceToSubtract = 10 + view.safeAreaInsets.bottom
        if let view = tabBarController {
            spaceToSubtract = view.tabBar.frame.size.height
        }
        let info = (sender as NSNotification).userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height - spaceToSubtract, 0)
        backTextView.contentInset = contentInsets
        backTextView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ sender: Notification) {
        //scroll to bottom of textView
        let contentInsets = UIEdgeInsets.zero
        backTextView.contentInset = contentInsets
        backTextView.scrollIndicatorInsets = contentInsets
    }
    
    //MARK: Navigation and Actions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else { return }
        let front = frontTextField.text ?? "No text"
        let back = backTextView.text ?? "No text"
        flashcard = Flashcard(front: front, back: back)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        //view controller needs to be dismissed differently depending on style of presentation
        if presentingViewController is UITabBarController {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The FlashcardViewController is not inside a navigation controller.")
        }
    }

    @objc func toolBarDoneButtonPressed(button: UIButton) {
        self.view.endEditing(true)
    }
}
