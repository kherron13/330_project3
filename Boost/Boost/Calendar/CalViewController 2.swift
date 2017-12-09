//
//  CalViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit
class CalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CalPROTOViewController {
  
    
    @IBOutlet weak var TableView: UITableView!
    
    //Creating an instance of EKEventStore to represent calendar database
    var eventStore = EKEventStore()
    
    var calendars: [EKCalendar] = [EKCalendar]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendars.count
    }
    
    //Labeling each cell in tableview with calendar name
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let calendar = calendars[indexPath.row]
        cell.textLabel?.text = calendar.title
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func calenderLoad() {
        self.loadData()
        self.refreshTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkForPermission()
    }
    
    
    //Checks to see if user has permission to calendar
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
        //Returns an array of calendars that support a given entity type, in this case a event.
        calendars = eventStore.calendars(for: .event)
        TableView.reloadData()
    }
    
    func refreshTableView() {
        TableView.isHidden = false
        TableView.reloadData()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Preparing data to segue to next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? ""){
        case "addSegue":
            //segues to addcalviewcontroller
            let guest = segue.destination as! UINavigationController
            let guestVC = guest.viewControllers[0] as! AddCalViewController
            guestVC.delagate? = self
        case "eventVC":
            //segues to eventscalviewcontroller
            let eventsVC = segue.destination as! EventsCalViewController
            let selectedIndexPath = TableView.indexPathForSelectedRow!
            
            eventsVC.calendar = calendars[(selectedIndexPath as NSIndexPath).row]
        default: break
            //print("GOing NoWhere")
        }
    }
}
