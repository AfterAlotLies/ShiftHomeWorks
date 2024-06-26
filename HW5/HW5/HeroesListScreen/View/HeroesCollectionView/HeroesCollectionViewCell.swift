//
//  HeroesCollectionViewCell.swift
//  HW5
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

class HeroesCollectionViewCell: UICollectionViewCell {
    
    static let identifer = String(describing: HeroesCollectionView.self)
    
    private lazy var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var heroNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = Colors.labelsTextColor
        label.font = Fonts.boldHeroNameFont27
        return label
    }()
    
    private lazy var heroPositionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = Colors.labelsTextColor
        label.font = Fonts.systemHeroPositionFont14
        return label
    }()
    
    private lazy var strengthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.strengthImage
        return imageView
    }()
    
    private lazy var agilityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.agilityImage
        return imageView
    }()
    
    private lazy var intelligenceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.intelligenceImage
        return imageView
    }()
    
    private lazy var strengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = Colors.labelsTextColor
        return label
    }()
    
    private lazy var agilityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = Colors.labelsTextColor
        return label
    }()
    
    private lazy var intelligenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = Colors.labelsTextColor
        return label
    }()
    
    private lazy var attributesInfoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [strengthImageView, strengthLabel,
                                                       agilityImageView, agilityLabel,
                                                       intelligenceImageView, intelligenceLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var heroInfoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heroImageView, 
                                                       heroNameLabel,
                                                       heroPositionLabel,
                                                       attributesInfoStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupItem()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("can not init")
    }
    
    // MARK: - Public methods
    func setDataToCell(data: HeroesCollectionModel) {
        heroImageView.image = UIImage(named: data.heroNameImage)
        heroNameLabel.text = data.heroName
        heroPositionLabel.text = data.heroPosition.rawValue
        strengthLabel.text = "\(data.heroStrength)"
        agilityLabel.text = "\(data.heroAgility)"
        intelligenceLabel.text = "\(data.heroIntelligence)"
    }
}

// MARK: - Private methods
private extension HeroesCollectionViewCell {
    
    func setupItem() {
        contentView.addSubview(heroInfoStack)
        
        setupCell()
        setupConstraints()
    }
    
    func setupCell() {
        backgroundColor = Colors.backBackgroundColor
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.masksToBounds = true
        layer.borderColor = Colors.backBackgroundColor.cgColor
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heroInfoStack.topAnchor.constraint(equalTo: self.topAnchor),
            heroInfoStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            heroInfoStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            heroInfoStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
