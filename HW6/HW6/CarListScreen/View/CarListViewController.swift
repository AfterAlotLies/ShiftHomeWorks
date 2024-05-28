//
//  CarListViewController.swift
//  HW6
//
//  Created by Vyacheslav on 24.05.2024.
//

import UIKit

protocol ICarListViewController: AnyObject {
    func passCarData(dataModel: [MainCarModel])
    func showNextController(_ viewController: UIViewController)
}

class CarListViewController: UIViewController {
    
    private enum Constants {
        static let tableViewHeader = "Марку машины"
    }
    
    private lazy var carListView: CarListView = {
        let view = CarListView(dataSource: dataSource, delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var carDetails = [MainCarModel]()
    private let carListPresenter: CarListPresenter
    private let dataSource: ICarListViewDataSource
    
    init(carListPresenter: CarListPresenter, dataSource: ICarListViewDataSource) {
        self.carListPresenter = carListPresenter
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        carListPresenter.fetchData(controller: self)
    }
}

extension CarListViewController: ICarListViewController {
    
    func passCarData(dataModel: [MainCarModel]) {
        dataSource.getCarInfo(carInfo: dataModel)
        carDetails = dataModel
        carListView.reloadTableViewData()
    }
    
    func showNextController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CarListViewController: ICarListViewTableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.tableViewHeader
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black

        headerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10)
        ])

        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < carDetails.count else { return }
        carListPresenter.setupNextController(passingData: carDetails[indexPath.row])
    }
}

private extension CarListViewController {
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(carListView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            carListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            carListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            carListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

