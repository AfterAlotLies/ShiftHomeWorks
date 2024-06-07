//
//  MainView.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit

class MainView: UIView {
    
    private enum Constants {
        static let topAnchorMargin: CGFloat = 16
        static let leadingAnchorMargin: CGFloat = 16
        static let trailingAnchorMargin: CGFloat = -16
    }
    
    private lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.placeholder = "Enter your keyword here..."
        return textField
    }()
    
    private lazy var findDogButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Find", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        
        button.addTarget(self, action: #selector(makeButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var dataTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainTableViewCell.self,
                           forCellReuseIdentifier: MainTableViewCell.identifer)
        tableView.dataSource = dataSource
        return tableView
    }()
    
    private let dataSource: IMainTableViewDataSource
    private var actionHandler: (() -> Void)?
    
    init(frame: CGRect, dataSource: IMainTableViewDataSource) {
        self.dataSource = dataSource
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTableView() {
        dataTableView.reloadData()
    }
    
    func findDogButtonAction(handler: (() -> Void)?) {
        actionHandler = handler
    }
    
    func getEnteredDogName() -> String? {
        if let dogName = inputTextField.text {
            return dogName.lowercased()
        } else {
            return nil
        }
    }
}

private extension MainView {
    
    func setupView() {
        backgroundColor = .clear
        
        addSubview(inputTextField)
        addSubview(findDogButton)
        addSubview(dataTableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.topAnchorMargin),
            inputTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            inputTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin),
            inputTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            findDogButton.heightAnchor.constraint(equalToConstant: 35),
            findDogButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: Constants.topAnchorMargin),
            findDogButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            findDogButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin)
        ])
        
        NSLayoutConstraint.activate([
            dataTableView.topAnchor.constraint(equalTo: findDogButton.bottomAnchor, constant: Constants.topAnchorMargin),
            dataTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.leadingAnchorMargin),
            dataTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.trailingAnchorMargin),
            dataTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    @objc
    func makeButtonAction() {
        actionHandler?()
    }
}
