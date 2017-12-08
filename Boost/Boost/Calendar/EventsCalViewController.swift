//
//  EventsCalViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit

class EventsCalViewController: UIViewController, UITableViewDataSource, EventsPROTO {
    
    @IBOutlet weak var CalTableView: UITableView!
    
    @IBOutlet weak var EventTableView: UITableView!
    
    let eventStore = EKEventStore()
    var calendar: EKCalendar!
    var events: [EKEvent] = [EKEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadEvents()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func eventsDidAdd() {
        self.loadEvents()
        self.EventTableView.reloadData()
    }
    
    //https://www.andrewcbancroft.com/2016/04/28/listing-calendar-events-with-event-kit-and-swift/
    func loadEvents() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let startDate = dateFormatter.date(from: "01/01/2017")
        let endDate = dateFormatter.date(from: "31/12/2017")
        
       // if let startDate = startDate, let endDate = endDate {
            
        let eventsPredicate = eventStore.predicateForEvents(withStart: startDate!, end: endDate!, calendars: [calendar])
            
        events = eventStore.events(matching: eventsPredicate).sorted {
                (event1: EKEvent, event2: EKEvent) in
                
                return event1.startDate.compare(event2.startDate) == ComparisonResult.orderedAscending
            }
        //}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo")!
        cell.textLabel?.text = events[(indexPath as NSIndexPath).row].title
        cell.detailTextLabel?.text = formatDate(events[(indexPath as NSIndexPath).row].startDate)

        return cell
    }
    
    //https://www.andrewcbancroft.com/2016/04/28/listing-calendar-events-with-event-kit-and-swift/
    func formatDate(_ date: Date?) -> String {
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
}
