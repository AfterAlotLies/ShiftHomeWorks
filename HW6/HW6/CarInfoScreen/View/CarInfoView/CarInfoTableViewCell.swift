//
//  CarInfoTableViewCell.swift
//  HW6
//
//  Created by Vyacheslav on 27.05.2024.
//

import UIKit

class CarInfoTableViewCell: UITableViewCell {
    
    static let identifer = String(describing: CarInfoTableViewCell.self)
    
    private lazy var bodyTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var choosenCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTypeToCell(type: String) {
        bodyTypeLabel.text = type
    }
    
    func setImageToSelectedCell() {
        choosenCellImageView.image = UIImage(named: "choosenCellImage")
    }
    
    func setDefaultImageToCell() {
        choosenCellImageView.image = UIImage(named: "unchoosenCellImage")
    }
}

private extension CarInfoTableViewCell {
    
    func setupCell() {
        addSubview(bodyTypeLabel)
        addSubview(choosenCellImageView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bodyTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bodyTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            choosenCellImageView.centerYAnchor.constraint(equalTo: bodyTypeLabel.centerYAnchor),
            choosenCellImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            choosenCellImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            choosenCellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            choosenCellImageView.leadingAnchor.constraint(equalTo: bodyTypeLabel.trailingAnchor, constant: 8),
            choosenCellImageView.widthAnchor.constraint(equalToConstant: 16),
            
        ])
    }
}
