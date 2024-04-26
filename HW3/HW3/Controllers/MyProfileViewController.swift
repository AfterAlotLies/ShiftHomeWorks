//
//  ViewController.swift
//  HW3
//
//  Created by Vyacheslav on 26.04.2024.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet private weak var myDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMyDescription()
    }
    
    private func setMyDescription() {
        ProfileModelDescription.allCases.forEach {
            myDescription.text += $0.rawValue + "\n"
        }
    }
}
