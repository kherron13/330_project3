//
//  TimerViewController.swift
//  Boost
//
//  Created by Kelly Herron on 11/13/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation


class TimerViewController: UIViewController {
    @IBOutlet weak var studyTimePicker: UIDatePicker!
    var breaktime:TimeInterval = 1
    var studytime:TimeInterval = 3
    @IBOutlet weak var startStudyButton: UIButton!
    @IBOutlet weak var breaktimePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Timer")
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
            if granted{
                print("Notification Permission Granted")
            }
        }
        NotificationCenter.default.addObserver(self, selector:#selector(self.goForBreak(notification:)),name:Notification.Name("GOFORBREAKSELECT"),object:nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.extendBreak(notification:)),name:Notification.Name("EXTENDBREAKSELECT"),object:nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.goToStudy(notification:)),name:Notification.Name("GOTOSTUDYSELECT"),object:nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.endStudy(notification:)),name:Notification.Name("ENDSTUDYSELECT"),object:nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.extendStudy(notification:)),name:Notification.Name("EXTENDSTUDYSELECT"),object:nil)
    }
    
    
    @objc func goForBreak(notification:Notification){
        scheduleNotification(title: "Productivity Timer", subtitle:"Study", body: "Your break time is over.",identifier: "GOTOSTUDY",image: "study",category:  "STUDYTIME_CATEGORY", inSeconds: self.breaktime, completion : {
            success in if success{
                print("Notified")
            }
            else{
                print("Not Notified")
            }
        })
    }
    @objc func extendBreak(notification:Notification){
        scheduleNotification(title: "Productivity Timer", subtitle:"Study", body: "Your extended break time is over.",identifier: "GOTOSTUDY",image: "study",category:  "STUDYTIME_CATEGORY", inSeconds: self.breaktime, completion : {
            success in if success{
                print("Notified")
            }
            else{
                print("Not Notified")
            }
        })
    }
    @objc func goToStudy(notification:Notification){
        scheduleNotification(title: "Productivity Timer", subtitle:"Break", body: "Please take a break.",identifier: "GOFORBREAK",image: "break",category:  "BREAKTIME_CATEGORY", inSeconds: self.studytime, completion : {
            success in if success{
                print("Notified")
            }
            else{
                print("Not Notified")
            }
        })
    }
    @objc func extendStudy(notification:Notification){
        scheduleNotification(title: "Productivity Timer", subtitle:"Break", body: "Please take a break. Extended study time is over.",identifier: "GOFORBREAK",image: "break",category:  "BREAKTIME_CATEGORY", inSeconds: self.breaktime, completion : {
            success in if success{
                print("Notified")
            }
            else{
                print("Not Notified")
            }
        })
    }
    @objc func endStudy(notification:Notification){
        return
    }
    
    func scheduleNotification(title : String,
                              subtitle : String,
                              body : String,
                              identifier : String,
                              image : String,
                              category: String,
        inSeconds : TimeInterval,completion: @escaping ( _ Success : Bool) -> ()){
        
        print(inSeconds)
        guard let imageUrl = Bundle.main.url(forResource:image,withExtension:"jpg")else{
            print("Image load fail")
            completion(false)
            return
        }
        
        var attachment:UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier:"notifImage",url:imageUrl,options:.none)
        
        let notif = UNMutableNotificationContent()
        notif.categoryIdentifier = category
        notif.title = title
        notif.subtitle = subtitle
        notif.body = body
        notif.sound = UNNotificationSound.default()
        
        notif.attachments = [attachment]
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval:inSeconds,repeats:false)
        let request = UNNotificationRequest(identifier : identifier,content : notif,trigger : notifTrigger)
        
        UNUserNotificationCenter.current().add(request,withCompletionHandler: {
            error in
            if error != nil{
                print(error ?? "")
                completion(false)
            }
            else{
                completion(true)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startStudyClicked(sender : UIButton){
        let hour = Calendar.current.dateComponents([.hour, .minute], from:  studyTimePicker.date).hour!
        let minute = Calendar.current.dateComponents([.hour, .minute], from:  studyTimePicker.date).minute!
        studytime = Double(hour*3600 + minute*60)
        
        let hour_break = Calendar.current.dateComponents([.hour, .minute], from: breaktimePicker.date).hour!
        let minute_break = Calendar.current.dateComponents([.hour, .minute], from: breaktimePicker.date).minute!
        breaktime = Double(hour_break*3600 + minute_break*60)
        let alert = UIAlertController(title: "Start Session", message: "Are you sure you want to study \(hour) hr:\(minute) min with break of \(hour_break) hr:\(minute_break) min", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Yes", style: .default) { (alert: UIAlertAction!) -> Void in
            //self.studytime = 2
            //self.breaktime = 2
            self.scheduleNotification(title: "Productivity Timer", subtitle:"Break", body: "Please take a break",identifier: "GOFORBREAK",image: "break", category: "BREAKTIME_CATEGORY",inSeconds: self.studytime, completion : {
                success in if success{
                    print("Notification sent")
                }
                else{
                    print("Not Notification sent")
                }
            })
        }
        let clearAction = UIAlertAction(title: "No", style: .destructive) { (alert: UIAlertAction!) -> Void in
            return
        }
        
        alert.addAction(clearAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion:nil)
        
    }
}
