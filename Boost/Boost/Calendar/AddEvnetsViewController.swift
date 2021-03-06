//
//  AddEvnetsViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/11/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit

class AddEvnetsViewController: UIViewController {

    let eventStore = EKEventStore()
    var calendar: EKCalendar!
    
    @IBOutlet weak var eventNameTF: UITextField!
    @IBOutlet weak var eventStartDatePicker: UIDatePicker!
    @IBOutlet weak var eventEndDatePicker: UIDatePicker!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var delegate: EventDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventStartDatePicker.setDate(initialDatePickerValue(), animated: false)
        self.eventEndDatePicker.setDate(initialDatePickerValue(), animated: false)
        eventNameTF.inputAccessoryView = createToolbar()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        // Do any additional setup after loading the view.
    }
    
    //https://www.andrewcbancroft.com/2016/06/02/creating-calendar-events-with-event-kit-and-swift/
    func initialDatePickerValue() -> Date {
        let calendarUnitFlags: NSCalendar.Unit = [.year, .month, .day, .hour, .minute, .second]
        
        var dateComponents = (Calendar.current as NSCalendar).components(calendarUnitFlags, from: Date())
        
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        
        return Calendar.current.date(from: dateComponents)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func canelBTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //https://www.andrewcbancroft.com/2016/06/02/creating-calendar-events-with-event-kit-and-swift/
    //Create and save event
    @IBAction func addEventBTn(_ sender: Any) {
        if let calendarForEvent = eventStore.calendar(withIdentifier: self.calendar.calendarIdentifier)
        {
            let newEvent = EKEvent(eventStore: eventStore)
            
            newEvent.calendar = calendarForEvent
            newEvent.title = self.eventNameTF.text ?? "Event Name"
            newEvent.startDate = self.eventStartDatePicker.date
            newEvent.endDate = self.eventEndDatePicker.date
            
            
            do {
                try eventStore.save(newEvent, span: .thisEvent, commit: true)
                delegate?.eventDidAdd()
                
                self.dismiss(animated: true, completion: nil)
            } catch {
                let alert = UIAlertController(title: "Event could not save", message: (error as NSError).localizedDescription, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(OKAction)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func createToolbar() -> UIToolbar {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toolBarDoneButtonPressed(button:)))
        doneButton.tintColor = UIColor(red: 146/255, green: 34/255, blue: 71/255, alpha: 1)
        toolBar.items = [flexibleSpace, doneButton]
        return toolBar
    }
    
    @objc func toolBarDoneButtonPressed(button: UIButton) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
