//
//  CalendarViewController.swift
//  Boost
//
//  Created by Kelly Herron on 11/13/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
// https://www.andrewcbancroft.com/2015/05/14/beginners-guide-to-eventkit-in-swift-requesting-permission/

import UIKit
import EventKit

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var TableView: UITableView!
    var eventStore = EKEventStore()
    var calendars: [EKCalendar] = [EKCalendar]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkForPermission()
    }
    
    
    
    func checkForPermission(){
        switch EKEventStore.authorizationStatus(for: .event){
        case .authorized:
            print("User has permission")
            loadData()
        case .notDetermined:
            print("Authorization unkown")
            eventStore.requestAccess(to: .event, completion: {(isAllowed, error)
                in
                
                if let error = error {
                    print(error.localizedDescription)
                }else{
                    if isAllowed {
                        self.loadData()
                    }
                }
            })
        case .restricted, .denied:
            print("User does not have authorization")
        }
    }
    
    func loadData(){
        calendars = eventStore.calendars(for: .event)
        TableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let calendar = calendars[indexPath.row]
        cell.textLabel?.text = calendar.title
        return cell
    }
 
   
    
}



