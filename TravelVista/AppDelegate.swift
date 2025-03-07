//
//  AppDelegate.swift
//  TravelVista
//
//  Created by Hamdi Tlili on 13/12/2023.
//



import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Create a UIHostingController with the SwiftUI ListView
        let listView = ListView()
        let hostingController = UIHostingController(rootView: listView)
        
        // Create a navigation controller with the hosting controller as root
        let navigationController = UINavigationController(rootViewController: hostingController)
        
        // Initialize window if not already initialized
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        // Set the navigation controller as root view controller
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
