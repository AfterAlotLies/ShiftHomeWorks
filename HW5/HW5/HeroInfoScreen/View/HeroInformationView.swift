//
//  HeroInformationView.swift
//  HW5
//
//  Created by Vyacheslav on 19.05.2024.
//

import UIKit

class HeroInformationView: UIView {
    
    private enum Constants {
        static let strengthImage: UIImage? = UIImage(named: "image3")
        static let agilityImage: UIImage? = UIImage(named: "image1")
        static let intelligenceImage: UIImage? = UIImage(named: "image2")
        static let heroImageSize: CGFloat = 150
        static let topAnchorMargin: CGFloat = 16
        static let leadingAnchorMargin: CGFloat = 16
        static let trailingAnchorMargin: CGFloat = -16
    }
    
    private lazy var heroImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var heroNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.labelsTextColor
        label.textAlignment = .center
        label.font = Fonts.boldHeroNameFont27
        return label
    }()
    
    private lazy var strengthImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.strengthImage
        return imageView
    }()
    
    private lazy var agilityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.intelligenceImage
        return imageView
    }()
    
    private lazy var intelligenceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Constants.agilityImage
        return imageView
    }()
    
    private lazy var strengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = Colors.labelsTextColor
        label.font = Fonts.systemHeroAttributesFont20
        return label
    }()
    
    private lazy var agilityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = Fonts.systemHeroAttributesFont20
        label.textColor = Colors.labelsTextColor
        return label
    }()
    
    private lazy var intelligenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = Fonts.systemHeroAttributesFont20
        label.textColor = Colors.labelsTextColor
        return label
    }()
    
    private lazy var attributesStackInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [strengthImage, strengthLabel,
                                                      agilityImage, agilityLabel,
                                                      intelligenceImage, intelligenceLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var heroDescription: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = Colors.labelsTextColor
        textView.showsVerticalScrollIndicator = false
        textView.font = Fonts.boldHeroDescriptionFont20
        textView.backgroundColor = Colors.clearBackgroundColor
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
        return textView
    }()
    
    private lazy var heroComplexityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show hero complexity", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.labelsTextColor.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showHeroComplexity), for: .touchUpInside)
        return button
    }()
    
    private var buttonAction: (() -> Void)?
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("can not init")
    }
    
    // MARK: - Public methods
    func setDataToUI(data: HeroInformationModel) {
        heroImage.image = UIImage(named: data.heroNameImage)
        heroNameLabel.text = data.heroName
        strengthLabel.text = "\(data.heroStrength)"
        agilityLabel.text = "\(data.heroAgility)"
        intelligenceLabel.text = "\(data.heroIntelligence)"
        heroDescription.text = data.description
    }
    
    func setAction(handler : (() -> Void)?) {
        buttonAction = handler
    }
    
    func updateConstraintsForOrientationChange() {
        NSLayoutConstraint.deactivate(self.constraints)
        
        if UIDevice.current.orientation.isLandscape {
            attributesStackInfo.isHidden = true
            
            NSLayoutConstraint.activate([
                heroImage.widthAnchor.constraint(equalToConstant: 150),
                heroImage.heightAnchor.constraint(equalToConstant: 150),
                heroImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                heroImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
            ])
            
            NSLayoutConstraint.activate([
                heroNameLabel.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: Constants.topAnchorMargin),
                heroNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
                heroNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
            ])
            
            NSLayoutConstraint.activate([
                heroDescription.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor, constant: Constants.topAnchorMargin),
                heroDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
                heroDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
            ])
            
            NSLayoutConstraint.activate([
                heroComplexityButton.topAnchor.constraint(equalTo: heroDescription.bottomAnchor, constant: Constants.topAnchorMargin),
                heroComplexityButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
                heroComplexityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
                heroComplexityButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
            ])
        } else {
            attributesStackInfo.isHidden = false
            setupConstraints()
        }
    }
}

// MARK: - Private methods
private extension HeroInformationView {
    
    @objc
    func showHeroComplexity() {
        buttonAction?()
    }
    
    func setupView() {
        backgroundColor = Colors.clearBackgroundColor
        
        addSubview(heroImage)
        addSubview(heroNameLabel)
        addSubview(attributesStackInfo)
        addSubview(heroDescription)
        addSubview(heroComplexityButton)
        
        setupConstraints()
    }
    
     func setupConstraints() {
        NSLayoutConstraint.deactivate(self.constraints)
        
        NSLayoutConstraint.activate([
            heroImage.widthAnchor.constraint(equalToConstant: Constants.heroImageSize),
            heroImage.heightAnchor.constraint(equalToConstant: Constants.heroImageSize),
            heroImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            heroImage.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.topAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            heroNameLabel.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: Constants.topAnchorMargin),
            heroNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            heroNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            attributesStackInfo.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor, constant: 16),
            attributesStackInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            attributesStackInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            heroDescription.topAnchor.constraint(equalTo: attributesStackInfo.bottomAnchor, constant: Constants.topAnchorMargin),
            heroDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            heroDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            heroComplexityButton.topAnchor.constraint(equalTo: heroDescription.bottomAnchor, constant: Constants.topAnchorMargin),
            heroComplexityButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            heroComplexityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            heroComplexityButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
