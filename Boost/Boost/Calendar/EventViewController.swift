//
//  EventViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/6/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit

class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    
    static let identifier = "eventVC"
    
    let eventStore = EKEventStore()
    
    var calendar:EKCalendar!
    
    var events: [EKEvent] = [EKEvent]()
    
    @IBOutlet weak var EventTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
    }
    
    func loadData(){
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        
        let startDate = dateFormat.date(from: "01/01/2017")
        let endDate = dateFormat.date(from: "31/12/2017")
        
        let eventPredicate = eventStore.predicateForEvents(withStart: startDate!, end: endDate!, calendars: [calendar])
        
        events = eventStore.events(matching: eventPredicate).sorted { (event1, event2)
            -> Bool in
            return event1.startDate.compare(event2.startDate)  == ComparisonResult.orderedAscending
        }
        print(events)
     
    }

    @IBAction func backBTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EventTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.title
        return cell
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
