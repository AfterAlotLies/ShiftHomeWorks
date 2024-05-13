//
//  HeroesListViewController.swift
//  HW4
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    private enum Constants {
        static let firstYcolor = UIColor(red: 84.0 / 255.0, green: 13.0 / 255.0, blue: 13.0 / 255.0, alpha: 1)
        static let secondYColor = UIColor(red: 26.0 / 255.0, green: 19.0 / 255.0, blue: 19.0 / 255.0, alpha: 1)
    }
    
    private var heroesMockData = DataManager.createMockData()
    
    private lazy var heroesListView: HeroesCollectionView = {
        let view = HeroesCollectionView(frame: .zero, delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        if UIDevice.current.orientation.isPortrait {
            setupBackgroundViewColor(orientation: .portrait)
        } else {
            setupBackgroundViewColor(orientation: .landscape)
        }
    }
    
    // MARK: - Setup methods
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(heroesListView)
        
        setupConstraints()
        setupBackgroundViewColor(orientation: .portrait)
        setupNavBar()
    }
    
    private func setupNavBar() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.clear
        
        navigationController?.navigationBar.standardAppearance = standardAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
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
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heroesListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heroesListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroesListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            heroesListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - HeroesListViewController + HeroesCollectionViewDelegate
extension HeroesListViewController: HeroesCollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < heroesMockData.count else { return }
        let heroInfoController = HeroInformationViewController()
        heroInfoController.passData(data: heroesMockData[indexPath.item])
        navigationController?.pushViewController(heroInfoController, animated: true)
    }
}

