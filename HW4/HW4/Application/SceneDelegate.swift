//
//  SceneDelegate.swift
//  HW4
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootController = NavigationViewController()
        window.rootViewController = rootController
        window.makeKeyAndVisible()
        self.window = window
    }
}

