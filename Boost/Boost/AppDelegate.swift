//
//  AppDelegate.swift
//  Boost
//
//  Created by Kelly Herron on 11/7/17.
//  Copyright © 2017 Kelly Herron. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var player: AVAudioPlayer?
    
        func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
             guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func configureCustomNotification(){
        let go_for_break = UNNotificationAction(identifier:"GOFORBREAK",title:"Go For Break",options:[])
        let extend_break = UNNotificationAction(identifier:"EXTENDBREAK",title:"Extend Break",options:[])
        let end_study = UNNotificationAction(identifier:"ENDSTUDY",title:"End Session",options:[UNNotificationActionOptions.foreground])
        let extend_study = UNNotificationAction(identifier:"EXTENDSTUDY",title:"Extend Study",options:[])
        let go_to_study = UNNotificationAction(identifier:"GOTOSTUDY",title:"Go To Study",options:[])
        
        let breaktime_category = UNNotificationCategory(identifier:"BREAKTIME_CATEGORY",actions:[go_for_break,extend_study,end_study],intentIdentifiers :[] , options:[])
        
        let studytime_category = UNNotificationCategory(identifier:"STUDYTIME_CATEGORY",actions:[go_to_study,extend_break,end_study],intentIdentifiers :[] , options:[])
        
        UNUserNotificationCenter.current().setNotificationCategories([breaktime_category,studytime_category])
    }

}
    extension AppDelegate:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        playSound()
        completionHandler(.alert)
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
            case "ENDSTUDY":
                NotificationCenter.default.post(name: Notification.Name("ENDSTUDYSELECT"), object: nil)
            break
            case "GOTOSTUDY":
                NotificationCenter.default.post(name: Notification.Name( "GOTOSTUDYSELECT"), object: nil)
            break
            case "GOFORBREAK":
                NotificationCenter.default.post(name: Notification.Name("GOFORBREAKSELECT") , object: nil)
            break
            case "EXTENDBREAK":
                NotificationCenter.default.post(name: Notification.Name("EXTENDBREAKSELECT") , object: nil)
            break
            case "EXTENDSTUDY":
                NotificationCenter.default.post(name: Notification.Name("EXTENDSTUDYSELECT"),object: nil)
            break
            default:
                print("Invalid Identifier")
            break
        }
        completionHandler()
    }
}

