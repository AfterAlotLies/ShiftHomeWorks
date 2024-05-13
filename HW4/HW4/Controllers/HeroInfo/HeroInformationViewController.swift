//
//  HeroInformationViewController.swift
//  HW4
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

class HeroInformationViewController: UIViewController {
    
    private enum Constants {
        static let firstYcolor = UIColor(red: 84.0 / 255.0, green: 13.0 / 255.0, blue: 13.0 / 255.0, alpha: 1)
        static let secondYColor = UIColor(red: 26.0 / 255.0, green: 19.0 / 255.0, blue: 19.0 / 255.0, alpha: 1)
    }
    
    private var heroComplexity: String = ""
    
    private lazy var heroInfoView: HeroInformationView = {
        let view = HeroInformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        heroInfoView.setAction { [weak self] in
            guard let self = self else { return }
            self.presentModalViewController()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: nil) { [weak self] context in
            guard let self = self else { return }
            if let presentedViewController = self.presentedViewController {
                presentedViewController.dismiss(animated: false) {
                    self.presentModalViewController()
                }
            }
            if UIDevice.current.orientation.isLandscape {
                self.heroInfoView.updateConstraintsForOrientationChange()
            } else {
                self.heroInfoView.updateConstraintsForOrientationChange()
            }
        }
    }

    private func presentModalViewController() {
        let heroComplexityController = HeroComplexityViewController()
        heroComplexityController.setComplexityData(passsingComplexity: heroComplexity)
        self.present(heroComplexityController, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        if UIDevice.current.orientation.isPortrait {
            setupBackgroundViewColor(orientation: .portrait)
        } else {
            setupBackgroundViewColor(orientation: .landscape)
            heroInfoView.updateConstraintsForOrientationChange()
        }
    }
    
    func passData(data: HeroesListModel) {
        heroInfoView.setDataToUI(data: data)
        heroComplexity = data.complexity.rawValue
    }
    
    private func setupView() {
        view.addSubview(heroInfoView)
        setupBackgroundViewColor(orientation: .portrait)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heroInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heroInfoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroInfoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            heroInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupBackgroundViewColor(orientation : AppOrientation) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [Constants.firstYcolor.cgColor, Constants.secondYColor.cgColor]
        
        switch orientation {
        case .portrait:
            gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        case .landscape:
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        }
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
