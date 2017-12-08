//
//  EventViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit
class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var newTableViewF: UITableView!
    
    static let identifier = "eventVC"
    let eventStore = EKEventStore()
    var calendar: EKCalendar!
    
    var events: [EKEvent] = [EKEvent] ()
    
    func loadEvents(){
        
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        
        let startDate = dateFormat.date(from: "01/01/2017")
        let endDate = dateFormat.date(from: "31/12/2017")
        
        let eventPredicate = eventStore.predicateForEvents(withStart: startDate!, end: endDate!, calendars: [calendar])
        
        events = eventStore.events(matching: eventPredicate).sorted {(event1, event2) -> Bool in
            return event1.startDate.compare(event2.startDate) == ComparisonResult.orderedAscending
            
            
        }
        print(events)
    }
    
    override func viewDidLoad() {
        newTableViewF.reloadData()
        super.viewDidLoad()
        //newTableViewF.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newTableViewF.dequeueReusableCell(withIdentifier: "uniCell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.title
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //newTableViewF.reloadData()
        loadEvents()
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
