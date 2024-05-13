//
//  HeroesCollectionView.swift
//  HW4
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

protocol HeroesCollectionViewDelegate: UICollectionViewDelegate {}

class HeroesCollectionView: UIView {
    
    let dataSource = HeroesCollectionViewDataSource()
    weak var delegate: HeroesCollectionViewDelegate?
    
    private lazy var heroesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: HeroesCollectionViewCell.identifer)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = dataSource
        return collectionView
    }()
    
    init(frame: CGRect, delegate: HeroesCollectionViewDelegate) {
        super.init(frame: frame)
        heroesCollectionView.delegate = delegate
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("can not to init")
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 180)
        layout.minimumLineSpacing = 10
        return layout
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(heroesCollectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heroesCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            heroesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            heroesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            heroesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
