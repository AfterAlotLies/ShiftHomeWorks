//
//  CarInfoView.swift
//  HW6
//
//  Created by Vyacheslav on 27.05.2024.
//

import UIKit

protocol ICarInfoTableViewDelegate: UITableViewDelegate {}

class CarInfoView: UIView {
    
    private enum Constants {
        static let buttonColor: UIColor = UIColor(red: 93.0 / 255.0, green: 176.0 / 255.0, blue: 117.0 / 255.0, alpha: 1)
        static let priceTextHeader = "Цена"
        static let buttonTitle = "Рассчитать цену"
        static let topAnchorMargin: CGFloat = 16
        static let leadingAnchorMargin: CGFloat = 16
        static let trailingAnchorMargin: CGFloat = -16
    }
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var priceTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.priceTextHeader
        label.font = Fonts.carInfoPriceTextFont
        label.textAlignment = .left
        return label
    }()
    
    private lazy var priceInformationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = Fonts.carInfoPriceTextFont
        return label
    }()
    
    private lazy var carBodyTypeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CarInfoTableViewCell.self,
                           forCellReuseIdentifier: CarInfoTableViewCell.identifer)
        tableView.dataSource = dataSource
        tableView.rowHeight = 44.0
        return tableView
    }()
    
    private lazy var calculatePriceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.buttonColor
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(calculatePriceAction), for: .touchUpInside)
        
        return button
    }()
    
    private let dataSource: ICarInfoViewDataSource
    private var buttonActionHandler: (() -> Void)?
    
    weak var delegate: ICarInfoTableViewDelegate?
    
    init(dataSource: ICarInfoViewDataSource, delegate: ICarInfoTableViewDelegate) {
        self.dataSource = dataSource
        super.init(frame: .zero)
        carBodyTypeTableView.delegate = delegate
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setActionHandler(handler: (() -> Void)?) {
        buttonActionHandler = handler
    }
    
    func setupUI(_ carNameImage: String, _ carPrice: Int) {
        carImageView.image = UIImage(named: carNameImage)
        priceInformationLabel.text = "\(carPrice)$"
    }
    
    func updateCarImage(image: String) {
        carImageView.image = UIImage(named: image)
    }
    
    func updateCarPrice(price: Int) {
        priceInformationLabel.text = "\(price)$"
    }
    
    func reloadTableView() {
        carBodyTypeTableView.reloadData()
    }
    
}

private extension CarInfoView {
    
    func setupView() {
        backgroundColor = .clear
        
        addSubview(carImageView)
        addSubview(priceTextLabel)
        addSubview(priceInformationLabel)
        addSubview(carBodyTypeTableView)
        addSubview(calculatePriceButton)
        setupConstraints()
    }
    
    @objc
    func calculatePriceAction() {
        buttonActionHandler?()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            carImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            carImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.topAnchorMargin),
            carImageView.widthAnchor.constraint(equalToConstant: 340),
            carImageView.heightAnchor.constraint(equalToConstant: 196)
        ])
        
        NSLayoutConstraint.activate([
            priceTextLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: Constants.topAnchorMargin),
            priceTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            priceTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            priceInformationLabel.topAnchor.constraint(equalTo: priceTextLabel.bottomAnchor, constant: Constants.topAnchorMargin),
            priceInformationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            priceInformationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            carBodyTypeTableView.topAnchor.constraint(equalTo: priceInformationLabel.bottomAnchor, constant: Constants.topAnchorMargin),
            carBodyTypeTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            carBodyTypeTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin),
        ])
        
        NSLayoutConstraint.activate([
            calculatePriceButton.topAnchor.constraint(equalTo: carBodyTypeTableView.bottomAnchor, constant: Constants.topAnchorMargin),
            calculatePriceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            calculatePriceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            calculatePriceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
    }
}
