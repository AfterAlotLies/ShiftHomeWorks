//
//  MySkills.swift
//  HW3
//
//  Created by Vyacheslav on 26.04.2024.
//

import UIKit

class MySkillsViewController: UIViewController {
    
    private lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = .black
        return textView
    }()
    
    private lazy var acquaintedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(introductionLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(acquaintedButton)
        
        NSLayoutConstraint.activate([
            introductionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            introductionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            introductionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextView.heightAnchor.constraint(equalToConstant: 300),
            descriptionTextView.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 36),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            acquaintedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            acquaintedButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            acquaintedButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            acquaintedButton.topAnchor.constraint(greaterThanOrEqualTo: descriptionTextView.bottomAnchor, constant: 16)
        ])
    }
    
    private func getData() {
        introductionLabel.text = SkillsModel.introductionLabel.rawValue
        
        SkillsDescription.allCases.forEach {
            descriptionTextView.text += $0.rawValue + "\n"
        }
        
        acquaintedButton.setTitle(SkillsModel.buttonTitle.rawValue, for: .normal)
    }
    
    @objc
    private func buttonAction() {
        makeAlert()
    }
    
}

private extension MySkillsViewController {
    
    func makeAlert() {
        let alert = UIAlertController(title: "Моя информация", message: "Вы ознакомились с моей информацией!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ознакомился!", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
