//
//  CalendarViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CheckForPermission()
    }
    
    func CheckForPermission(){
        switch EKEventStore.authorizationStatus(for: .event) {
        case .notDetermined:
            print("User does not have permission to calendar")
        case .authorized:
            print("User has permission tp access calendar")
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
            print("Does NOT have permission")
        }
    }
    
    func loadData(){
        print("Load Calendars")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let calendar = calendars[indexPath.row]
        guard let eventVC = self.storyboard?.instantiateViewController(withIdentifier: EventViewController.indentifier) as? EventViewController else { return }
        eventVC.calendar = calendar
        
        self.navigationController?.pushViewController(eventVC, animated: true)
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
