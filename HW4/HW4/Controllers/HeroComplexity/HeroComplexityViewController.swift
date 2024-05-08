//
//  HeroComplexityViewController.swift
//  HW4
//
//  Created by Vyacheslav on 07.05.2024.
//

import UIKit

class HeroComplexityViewController: UIViewController {
    
    private enum Constants {
        static let firstYcolor = UIColor(red: 84.0 / 255.0, green: 13.0 / 255.0, blue: 13.0 / 255.0, alpha: 1)
        static let secondYColor = UIColor(red: 26.0 / 255.0, green: 19.0 / 255.0, blue: 19.0 / 255.0, alpha: 1)
    }

    private var complexity: String = ""
    
    private lazy var heroComplexityView: HeroComplexityView = {
        let view = HeroComplexityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setData(complexity: complexity)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setComplexityData(passsingComplexity: String) {
        complexity = passsingComplexity
    }
    
    private func setupView() {
        view.addSubview(heroComplexityView)
        setupBackgroundViewColor(orientation: .portrait)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heroComplexityView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heroComplexityView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroComplexityView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            heroComplexityView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupBackgroundViewColor(orientation : AppOrientation) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [Constants.firstYcolor.cgColor, Constants.secondYColor.cgColor]
        
        switch orientation {
        case .portrait:
            gradientLayer.startPoint = CGPoint(x: 1, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        case .landscape:
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        }
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
