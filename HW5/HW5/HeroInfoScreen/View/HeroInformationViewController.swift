//
//  HeroInformationViewController.swift
//  HW5
//
//  Created by Vyacheslav on 19.05.2024.
//

import UIKit

// MARK: - IHeroInformationViewController
protocol IHeroInformationViewController: AnyObject {
    func setUI(model: HeroInformationModel)
    func presentModalController(_ viewController: UIViewController)
}

// MARK: - HeroInformationViewController
class HeroInformationViewController: UIViewController {
    
    private enum Constants {
        static let firstYcolor = UIColor(red: 84.0 / 255.0, green: 13.0 / 255.0, blue: 13.0 / 255.0, alpha: 1)
        static let secondYColor = UIColor(red: 26.0 / 255.0, green: 19.0 / 255.0, blue: 19.0 / 255.0, alpha: 1)
    }
    
    private var heroComplexity: HeroComplexity
    private var presenter: Presenter
    
    private lazy var heroInfoView: HeroInformationView = {
        let view = HeroInformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    init(presenter: Presenter, complexity: HeroComplexity) {
        self.presenter = presenter
        self.heroComplexity = complexity
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.didLoad(ui: self)
        presenter.showModalViewController()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: nil) { [weak self] context in
            guard let self = self else { return }
            if let presentedViewController = self.presentedViewController {
                presentedViewController.dismiss(animated: false) {
                    self.presenter.showModalViewController()
                }
            }
            if UIDevice.current.orientation.isLandscape {
                self.heroInfoView.updateConstraintsForOrientationChange()
            } else {
                self.heroInfoView.updateConstraintsForOrientationChange()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        if UIDevice.current.orientation.isPortrait {
            setupBackgroundViewColor(orientation: .portrait)
        } else {
            setupBackgroundViewColor(orientation: .landscape)
            heroInfoView.updateConstraintsForOrientationChange()
        }
    }
}

// MARK: - HeroInformationViewController + IHeroInformationViewController
extension HeroInformationViewController: IHeroInformationViewController {
    
    func setUI(model: HeroInformationModel) {
        heroInfoView.setDataToUI(data: model)
    }
    
    func presentModalController(_ viewController: UIViewController) {
        heroInfoView.setAction { [weak self] in
            guard let self = self else { return }
            self.present(viewController, animated: true)
        }
    }
}

// MARK: - Private methods
private extension HeroInformationViewController {
    
    func setupView() {
        view.addSubview(heroInfoView)
        setupBackgroundViewColor(orientation: .portrait)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heroInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heroInfoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroInfoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            heroInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
