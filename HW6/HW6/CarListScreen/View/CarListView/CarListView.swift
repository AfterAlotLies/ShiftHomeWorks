//
//  CarListView.swift
//  HW6
//
//  Created by Vyacheslav on 24.05.2024.
//

import UIKit

protocol ICarListViewTableViewDelegate: UITableViewDelegate {}

class CarListView: UIView {
    
    private enum Constants {
        static let titleScreenText = "Выберите"
        static let tableViewRowHeight = 44.0
    }
    
    private lazy var titleScreenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.carListTitleScreenLabelFont
        label.text = Constants.titleScreenText
        label.textAlignment = .center
        return label
    }()
    
    private lazy var carListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CarListTableViewCell.self,
                           forCellReuseIdentifier: CarListTableViewCell.identifer)
        tableView.dataSource = dataSource
        tableView.rowHeight = Constants.tableViewRowHeight
        return tableView
    }()
    
    private let dataSource: ICarListViewDataSource
    weak var delegate: ICarListViewTableViewDelegate?
    
    init(dataSource: ICarListViewDataSource, delegate: ICarListViewTableViewDelegate) {
        self.dataSource = dataSource
        super.init(frame: .zero)
        carListTableView.delegate = delegate
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTableViewData() {
        carListTableView.reloadData()
    }
    
}

private extension CarListView {
    
    func setupView() {
        backgroundColor = .clear
        
        addSubview(titleScreenLabel)
        addSubview(carListTableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleScreenLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleScreenLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleScreenLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            carListTableView.topAnchor.constraint(equalTo: titleScreenLabel.bottomAnchor, constant: 8),
            carListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            carListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            carListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
