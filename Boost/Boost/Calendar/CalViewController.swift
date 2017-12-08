//
//  CalViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit
class CalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    var eventStore = EKEventStore()
    var calendars: [EKCalendar] = [EKCalendar]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendars.count
    }
    
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//         //let calendar = calendars[indexPath.row]
//        performSegue(withIdentifier: "cell", sender: self)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let calendar = calendars[indexPath.row]

        guard let eventVC = self.storyboard?.instantiateViewController(withIdentifier: EventViewController.identifier) as? EventViewController else { return }

        eventVC.calendar = calendar

        self.navigationController?.pushViewController(eventVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
