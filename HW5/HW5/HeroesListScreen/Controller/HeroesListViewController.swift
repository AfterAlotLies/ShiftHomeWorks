//
//  HeroesListViewController.swift
//  HW5
//
//  Created by Vyacheslav on 19.05.2024.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    private enum Constants {
        static let firstYcolor = UIColor(red: 84.0 / 255.0, green: 13.0 / 255.0, blue: 13.0 / 255.0, alpha: 1)
        static let secondYColor = UIColor(red: 26.0 / 255.0, green: 19.0 / 255.0, blue: 19.0 / 255.0, alpha: 1)
    }
    
    private let heroesMockData = DataManager.createMockData()
    
    private lazy var heroesListView: HeroesCollectionView = {
        let view = HeroesCollectionView(frame: .zero, delegate: self)
        view.dataSource.mockData = convertDataModel(data: heroesMockData)
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
}

// MARK: - HeroesListViewController + HeroesCollectionViewDelegate
extension HeroesListViewController: HeroesCollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < heroesMockData.count else { return }
        let heroInfoController = HeroInformationViewController(presenter: Presenter(heroInfo: heroesMockData[indexPath.item]),
                                                               complexity: heroesMockData[indexPath.item].complexity)
        navigationController?.pushViewController(heroInfoController, animated: true)
    }
}

// MARK: - Private methods
private extension HeroesListViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(heroesListView)
        
        setupConstraints()
        setupBackgroundViewColor(orientation: .portrait)
        setupNavBar()
    }
    
    func convertDataModel(data: [HeroesListModel]) -> [HeroesCollectionModel] {
        var convertedModel = [HeroesCollectionModel]()
        for heroesMockDatum in heroesMockData {
            convertedModel.append(HeroesCollectionModel.init(heroNameImage: heroesMockDatum.heroNameImage,
                                                             heroName: heroesMockDatum.heroName,
                                                             heroPosition: heroesMockDatum.heroPosition,
                                                             heroStrength: heroesMockDatum.heroStrength,
                                                             heroAgility: heroesMockDatum.heroAgility,
                                                             heroIntelligence: heroesMockDatum.heroIntelligence))
        }
        return convertedModel
    }
    
    func setupNavBar() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.clear
        
        navigationController?.navigationBar.standardAppearance = standardAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
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
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heroesListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heroesListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            heroesListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            heroesListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

