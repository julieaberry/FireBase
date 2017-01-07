//
//  AppDelegate.swift
//  FireBaseStudy
//
//  Created by KimSeongJoon on 2016. 12. 17..
//  Copyright © 2016년 KimSeongJoon. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) ->   Bool {
        
        FIRApp.configure()
        
        let setting: UIUserNotificationSettings = UIUserNotificationSettings.init(types: [.alert, .badge, .sound], categories: nil)
        
        application.registerUserNotificationSettings(setting)
        application.registerForRemoteNotifications()
        
        return true
    }

}

