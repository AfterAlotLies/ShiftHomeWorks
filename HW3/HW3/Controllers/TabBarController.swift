//
//  TabBarController.swift
//  HW3
//
//  Created by Vyacheslav on 26.04.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarBorder()
    }
    
    private func setupTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let profileController = storyboard.instantiateViewController(withIdentifier: "profileController") as? MyProfileViewController else {
            fatalError("can not iniated profile controller")
        }
        let mySkillsController = MySkillsViewController()
        let myHobbiesController = MyHobbiesViewController()
        
        profileController.title = "Мой профиль"
        mySkillsController.title = "Мои навыки"
        myHobbiesController.title = "Мои хобби"
        
        setViewControllers([profileController, mySkillsController, myHobbiesController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["profileImage", "skillsImage", "hobbiesImage"]
        
        for item in 0...2 {
            items[item].image = UIImage(named: images[item])
        }
    }
    
    private func setupTabBarBorder() {
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 0.5)
        topBorder.backgroundColor = UIColor.darkGray.cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.unselectedItemTintColor = .gray
    }
}
