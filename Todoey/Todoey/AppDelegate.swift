//
//  AppDelegate.swift
//  Todoey
//
//  Created by Xuan Yang on 1/10/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do {
            _ = try Realm()

        } catch {
            print("Error initializing new realm, \(error)")
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        // Override point for customization after application launch.
        return true
    }
    
}





