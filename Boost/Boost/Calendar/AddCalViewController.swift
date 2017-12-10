//
//  AddCalViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit
class AddCalViewController: UIViewController {
    var delagate: CalPROTOViewController?
    
    @IBOutlet weak var textFLd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFLd.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CancelBTn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //https://www.andrewcbancroft.com/2015/06/17/creating-calendars-with-event-kit-and-swift/
    @IBAction func addCalBTn(_ sender: Any) {
        // Create an Event Store instance
        let eventStore = EKEventStore();
        
        // Use Event Store to create a new calendar instance
        let newCalendar = EKCalendar(for: .event, eventStore: eventStore)
        
        // Probably want to prevent someone from saving a calendar
        // if they don't type in a name...
        newCalendar.title = textFLd.text ?? "Some Calendar Name"
        
        // Access list of available sources from the Event Store
        let sourcesInEventStore = eventStore.sources
        
        // Filter the available sources and select the "Local" source to assign to the new calendar's
        // source property
        newCalendar.source = sourcesInEventStore.filter{
            (source: EKSource) -> Bool in
            source.title == "Subscribed Calendars" ||//previously was local, but local only exists when no accounts for calendar are enabled, which would cause a crash.
            source.sourceType.rawValue == EKSourceType.local.rawValue //maintain support for local calendar if necessary
            }.first!
        
        // Save the calendar using the Event Store instance
        do {
            try eventStore.saveCalendar(newCalendar, commit: true)
            UserDefaults.standard.set(newCalendar.calendarIdentifier, forKey: "EventTrackerPrimaryCalendar")
            delagate?.calenderLoad()
            self.dismiss(animated: true, completion: nil)
        } catch {
            let alert = UIAlertController(title: "Calendar could not save", message: (error as NSError).localizedDescription, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(OKAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
