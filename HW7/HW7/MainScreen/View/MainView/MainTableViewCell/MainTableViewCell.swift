//
//  MainTableViewCell.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    private lazy var dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    static let identifer = String(describing: MainTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ image: UIImage) {
        dogImageView.image = image
    }
    
}

private extension MainTableViewCell {
    
    func setupCell() {
        addSubview(dogImageView)
        setupCellConstraints()
    }
    
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            dogImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            dogImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            dogImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
