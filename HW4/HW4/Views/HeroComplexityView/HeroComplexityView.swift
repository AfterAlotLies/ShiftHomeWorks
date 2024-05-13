//
//  HeroComplexityView.swift
//  HW4
//
//  Created by Vyacheslav on 07.05.2024.
//

import UIKit

class HeroComplexityView: UIView {
    
    private lazy var complexityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Fonts.boldSystemFont30
        label.textColor = Colors.whiteColor
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("can not to init")
    }
    
    func setData(complexity: String) {
        complexityLabel.text = "Complexity of this hero is: \(complexity)"
    }
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(complexityLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            complexityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            complexityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            complexityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
}
