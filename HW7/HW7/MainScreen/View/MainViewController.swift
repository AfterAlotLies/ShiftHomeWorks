//
//  MainViewController.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit

protocol IMainViewController: AnyObject {
    func reloadTableView()
    func showErrorAlert(error: Error)
}

class MainViewController: UIViewController {
    
    private lazy var mainView: MainView = {
        let view = MainView(frame: .zero, dataSource: dataSource)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dataSource: IMainTableViewDataSource
    private let presenter: MainPresenter
    
    init(dataSource: IMainTableViewDataSource, presenter: MainPresenter) {
        self.dataSource = dataSource
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.findDogButtonAction { [weak self] in
            guard let self = self else { return }
            self.presenter.didLoad(ui: self, findDog: self.mainView.getEnteredDogName())
        }
        setupView()
    }

}

extension MainViewController: IMainViewController {
    
    func reloadTableView() {
        mainView.reloadTableView()
    }
    
    func showErrorAlert(error: Error) {
        let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

private extension MainViewController {
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

