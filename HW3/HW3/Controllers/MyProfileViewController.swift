//
//  MyProfileViewController.swift
//  HW3
//
//  Created by Vyacheslav on 26.04.2024.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet private weak var myDescription: UITextView!
    
    let profileDescription = ProfileModelDescription(age: "20 лет",
                                                     city: "Новосибирск",
                                                     education: "Оконченное среднее",
                                                     study: "Студент Университета СибГУТИ",
                                                     faculty: "Информатика и вычислительная техника",
                                                     course: "3 курс")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMyDescription()
    }
    
    private func setMyDescription() {
        myDescription.text = """
            - \(profileDescription.age)
            - \(profileDescription.city)
            - \(profileDescription.education)
            - \(profileDescription.study)
            - \(profileDescription.faculty)
            - \(profileDescription.course)
        """
    }
}
