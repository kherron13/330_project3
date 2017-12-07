//
//  EventViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit

class EventViewController: UIViewController {

    static let indentifier = "eventVC"
    let eventStore = EKEventStore()
    var calendar: EKCalendar!
    var events: [EKEvent] = [EKEvent]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadEvents()
    }
    
    func loadEvents(){
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        
        let startDate = dateFormat.date(from: "10/10/2017")
        let endDate = dateFormat.date(from: "31/12/2017")
        
        let eventPredicate = eventStore.predicateForEvents(withStart: startDate!, end: endDate!, calendars: [calendar])
        events = eventStore.events(matching: eventPredicate).sorted {(event1, event2) -> Bool in
            return event1.startDate.compare(event2.startDate) == ComparisonResult.orderedAscending
        }
        print(events)
    

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
