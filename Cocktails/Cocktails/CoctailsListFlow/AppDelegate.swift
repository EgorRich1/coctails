//
//  AppDelegate.swift
//  Cocktails
//
//  Created by Егор Ярошук on 29.11.22.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        DatabaseService.shared.setup()
        
        return true
    }
}
