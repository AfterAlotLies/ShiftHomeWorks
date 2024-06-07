//
//  AppDelegate.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var backgroundSessionCompletionHandler: (() -> Void)?
    private var networkManager: NetworkManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        networkManager = NetworkManager()
        return true
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        networkManager?.backgroundSession.getTasksWithCompletionHandler { tasks, _, _  in
            completionHandler()
        }
    }
}


