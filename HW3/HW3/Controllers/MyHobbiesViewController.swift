//
//  MyHobbiesViewController.swift
//  HW3
//
//  Created by Vyacheslav on 26.04.2024.
//

import UIKit

class MyHobbiesViewController: UIViewController {
    
    private enum Constants {
        static let topAnchorMargin: CGFloat = 16
        static let leadingAnchorMargin: CGFloat = 16
        static let trailingAnchorMargin: CGFloat = -16
    }
    
    private lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.boldSystemFont25
        label.textColor = Colors.blackColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hobbyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.systemFont20
        label.textColor = Colors.blackColor
        label.numberOfLines = 4
        return label
    }()
    
    private lazy var continueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.systemFont20
        label.textColor = Colors.blackColor
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var contentView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let scrollViewContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDescription()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.whiteColor
        view.addSubview(introductionLabel)
        view.addSubview(hobbyLabel)
        view.addSubview(continueLabel)
        view.addSubview(contentView)
        contentView.addSubview(scrollViewContainerView)
        setupImagesToStackView()
        
        NSLayoutConstraint.activate([
            introductionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.topAnchorMargin),
            introductionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingAnchorMargin),
            introductionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            hobbyLabel.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 36),
            hobbyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingAnchorMargin),
            hobbyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            continueLabel.topAnchor.constraint(equalTo: hobbyLabel.bottomAnchor, constant: Constants.topAnchorMargin),
            continueLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingAnchorMargin),
            continueLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: continueLabel.bottomAnchor, constant: Constants.topAnchorMargin),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingAnchorMargin),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.trailingAnchorMargin),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            scrollViewContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollViewContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollViewContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollViewContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollViewContainerView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    private func setDescription() {
        introductionLabel.text = HobbiesModel.introductionLabel.rawValue
        hobbyLabel.text = HobbiesModel.hobbyLabel.rawValue
        continueLabel.text = HobbiesModel.continueLabel.rawValue
    }
    
    private func setupImagesToStackView() {
        let images = ["invokerImage", "tinkerImage", "odImage", "stormImage"]
        images.forEach { imageName in
            if let image = UIImage(named: imageName) {
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                scrollViewContainerView.addArrangedSubview(imageView)
            }
        }
    }
}
