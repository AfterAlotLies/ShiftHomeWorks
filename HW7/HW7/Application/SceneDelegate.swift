//
//  SceneDelegate.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let dataSource = MainTableViewDataSource()
        let networkManager = NetworkManager()
        let dataManager = DataManager()
        let presenter = MainPresenter(networkManager: networkManager, dataSource: dataSource, dataManager: dataManager)
        
        let rootViewController = MainViewController(dataSource: dataSource, presenter: presenter)
        window.rootViewController = rootViewController
        
        window.makeKeyAndVisible()
        self.window = window
    }
}

