//
//  NewCalViewController.swift
//  Boost
//
//  Created by Noel Castillo on 12/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import EventKit
class NewCalViewController: UIViewController {

    let eventStore = EKEventStore()
    @IBOutlet weak var calendarTitleTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func ADDBTN(_ sender: Any) {
        guard let calendarTitle:String = calendarTitleTF.text, !calendarTitle.isEmpty else { return }
        let newCalendar = EKCalendar(for: .event, eventStore: eventStore)
        newCalendar.title = calendarTitle

        let sources = eventStore.sources
        newCalendar.source = sources.filter({(source) -> Bool in
            return source.sourceType.rawValue == EKSourceType.local.rawValue
        }).first!
        
        do{
            try eventStore.saveCalendar(newCalendar, commit: true)
            let _ = self.navigationController?.popViewController(animated: true)
        }catch{
            
            let alert = UIAlertController(title: "New Calendar", message: "could not save calendar", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
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
