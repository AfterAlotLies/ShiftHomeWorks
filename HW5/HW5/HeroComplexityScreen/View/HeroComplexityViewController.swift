//
//  HeroComplexityViewController.swift
//  HW5
//
//  Created by Vyacheslav on 19.05.2024.
//

import UIKit

class HeroComplexityViewController: UIViewController {
    
    private var complexity: String = ""
    private let viewModel: ViewModel
    
    private lazy var heroComplexityView: HeroComplexityView = {
        let view = HeroComplexityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Public methods
    func setComplexityData(passsingComplexity: String) {
        complexity = passsingComplexity
    }
}

// MARK: - HeroComplexityViewController + IViewModel
extension HeroComplexityViewController: IViewController {
    
    func setComplexityLabel(complexity: HeroComplexityModel) {
           DispatchQueue.main.async {
               self.heroComplexityView.complexityLabel.text = complexity.complexity
           }
       }
}

// MARK: - Private methods
private extension HeroComplexityViewController {
    
    func setupView() {
        view.addSubview(heroComplexityView)
        setupBackgroundViewColor(orientation: .portrait)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heroComplexityView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heroComplexityView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroComplexityView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            heroComplexityView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupBackgroundViewColor(orientation : AppOrientation) {
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
