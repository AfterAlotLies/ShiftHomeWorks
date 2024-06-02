//
//  CarInfoViewController.swift
//  HW6
//
//  Created by Vyacheslav on 27.05.2024.
//

import UIKit

protocol ICarInfoViewController: AnyObject {
    func setupCarData(dataModel: [CarInfoModel])
    func updateCarImage(carImageName: String, choosenCell: Int)
    func updateCarPrice(carPrice: Int)
    func loadData()
}

class CarInfoViewController: UIViewController {
    
    private enum Constants {
        static let tableViewHeader = "Выберите тип кузова"
    }
    
    private lazy var carInfoView: CarInfoView = {
        let view = CarInfoView(dataSource: dataSource, delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loaderIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.color = .black
        return indicator
    }()
    
    private let carInfoPresenter: CarInfoPresenter
    private let dataSource: ICarInfoViewDataSource
    
    private var carDetails = [CarInfoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        carInfoPresenter.didLoad(ui: self)
        setupView()
    }
    
    init(carInfoPresenter: CarInfoPresenter, dataSource: ICarInfoViewDataSource) {
        self.dataSource = dataSource
        self.carInfoPresenter = carInfoPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarInfoViewController: ICarInfoViewController {
    
    func setupCarData(dataModel: [CarInfoModel]) {
        carDetails = dataModel
        let bodyTypeData = dataModel.map { data in
            data.carBody
        }
        
        carInfoView.setupUI(dataModel[0].markNameImage,
                            dataModel[0].carPrice)
        
        dataSource.setCarBodyTypeData(bodyType: bodyTypeData)
    }
    
    func updateCarImage(carImageName: String, choosenCell: Int) {
        carInfoView.updateCarImage(image: carImageName)
        dataSource.setChoosenCellIndex(choosenCell)
        carInfoView.reloadTableView()
    }
    
    func updateCarPrice(carPrice: Int) {
        carInfoView.setActionHandler { [weak self] in
            guard let self = self else { return }
            self.carInfoView.updateCarPrice(price: carPrice)
        }
    }
    
    func loadData() {
        hideCarInfoView()
        startLoaderActivity()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.stopLoaderActivity()
            self.showCarInfoView()
        }
    }
    
}

extension CarInfoViewController: ICarInfoTableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carType = carDetails[indexPath.row]
        carInfoPresenter.setUpdatedCarData(data: carType, choosenIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.tableViewHeader
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black

        headerView.addSubview(label)

        return headerView
    }
}

private extension CarInfoViewController {
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(carInfoView)
        view.addSubview(loaderIndicator)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            carInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carInfoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            carInfoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            carInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loaderIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func startLoaderActivity() {
        loaderIndicator.isHidden = false
        loaderIndicator.startAnimating()
    }
    
    func stopLoaderActivity() {
        loaderIndicator.stopAnimating()
        loaderIndicator.isHidden = true
    }
    
    func showCarInfoView() {
        carInfoView.isHidden = false
    }
    
    func hideCarInfoView() {
        carInfoView.isHidden = true
    }
}
