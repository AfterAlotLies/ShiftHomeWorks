//
//  SceneDelegate.swift
//  HW5
//
//  Created by Vyacheslav on 19.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let heroesListController = HeroesListViewController()
        
        navigationController.viewControllers = [heroesListController]
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
        self.window = window
    }

}

