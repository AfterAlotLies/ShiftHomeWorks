//
//  SceneDelegate.swift
//  HW6
//
//  Created by Vyacheslav on 24.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        
        let networkManager = NetworkManager()
        let dataSource = CarListViewDataSource()
        let carListPresenter = CarListPresenter(networkManager: networkManager, dataSource: dataSource)
        let carListViewController = CarListViewController(carListPresenter: carListPresenter, dataSource: dataSource)
        
        navigationController.viewControllers = [carListViewController]
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
        self.window = window
    }
}

