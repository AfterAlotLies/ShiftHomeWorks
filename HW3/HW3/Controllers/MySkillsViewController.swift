//
//  MySkillsViewController.swift
//  HW3
//
//  Created by Vyacheslav on 26.04.2024.
//

import UIKit

class MySkillsViewController: UIViewController {
    
    private lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.boldSystemFont25
        label.textColor = Colors.blackColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.font = Fonts.systemFont20
        textView.textColor = Colors.blackColor
        return textView
    }()
    
    private lazy var acquaintedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.clearColor.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.systemBlueColor
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private let skillsDescription = SkillsDescriptionModel.init(
        yearEducation: "Обучаюсь программированию с 10 класса",
        language: "Первыми языками были С и С++",
        swiftYearEducation: "Swift изучаю 8 месяцев",
        expactations: "От обучения ожидаю информации, которая пригодится в будущем для работы"
    )
    
    private let skillsUIData = SkillsUIData.init(
        introductionText: "Мои навыки разработчика",
        buttonTitle: "Ознакомился!"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setUIData()
        setDescription()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.whiteColor
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
    
    private func setDescription() {
        descriptionTextView.text = """
        - \(skillsDescription.yearEducation),
        - \(skillsDescription.language),
        - \(skillsDescription.swiftYearEducation),
        - \(skillsDescription.expactations)
        """
    }
    
    private func setUIData() {
        introductionLabel.text = skillsUIData.introductionText
        acquaintedButton.setTitle(skillsUIData.buttonTitle, for: .normal)
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
