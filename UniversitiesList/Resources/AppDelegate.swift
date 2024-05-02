//
//  AppDelegate.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 01/05/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UniversitiesListRouter().createModule()
        window?.makeKeyAndVisible()
        
        return true
    }
}

