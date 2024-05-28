//
//  CarListTableViewCell.swift
//  HW6
//
//  Created by Vyacheslav on 26.05.2024.
//

import UIKit

class CarListTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let viewIndicatorColor: UIColor = UIColor(red: 93.0 / 255.0, green: 176.0 / 255.0, blue: 117.0 / 255.0, alpha: 1)
    }
    
    private lazy var viewIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.cornerRadius = 10
        view.backgroundColor = Constants.viewIndicatorColor
        return view
    }()
    
    private lazy var carMarkNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    static let identifer = String(describing: CarListTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMarkNameToUI(data: CarListModel) {
        carMarkNameLabel.text = data.markName
    }
}

private extension CarListTableViewCell {
    
    func setupCell() {
        addSubview(viewIndicator)
        addSubview(carMarkNameLabel)
        setupCellConstraints()
    }
    
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            viewIndicator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewIndicator.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            viewIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            viewIndicator.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            carMarkNameLabel.leadingAnchor.constraint(equalTo: viewIndicator.trailingAnchor, constant: 16),
            carMarkNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            carMarkNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            carMarkNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
