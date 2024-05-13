//
//  NavigationViewController.swift
//  HW4
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        let heroesListController = HeroesListViewController()
        viewControllers = [heroesListController]
    }
}
