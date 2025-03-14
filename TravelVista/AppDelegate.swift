//
//  AppDelegate.swift
//  TravelVista
//
//  Created by Hamdi Tlili on 13/12/2023.
//



import UIKit
import SwiftUI

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let listView = ListView()
        let hostingController = UIHostingController(rootView: listView)
        
        
        let navigationController = UINavigationController(rootViewController: hostingController)
        
        
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
