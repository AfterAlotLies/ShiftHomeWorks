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

    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        NetworkManager.shared.backgroundSession.getTasksWithCompletionHandler { _, _, _ in
            self.backgroundSessionCompletionHandler = completionHandler
        }
    }
}

