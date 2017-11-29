//
//  CalendarViewController.swift
//  Boost
//
//  Created by Kelly Herron on 11/13/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let dataArray = ["Calendar 1", "Calendar 2", "Calendar 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("Calendar")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCell") as! UITableViewCell
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
}
