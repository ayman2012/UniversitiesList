//
//  AppDelegate.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 01/05/2024.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UniversitiesListRouter().createModule()
        window?.makeKeyAndVisible()
        configMigration()
        return true
    }
    private func configMigration() {
           // perform migration if necessary
           let config = Realm.Configuration(
               schemaVersion: 4,
               migrationBlock: { migration, oldSchemaVersion in
                   // additional process such as rename, combine fields and link to other object
               })
           Realm.Configuration.defaultConfiguration = config
       }
}

