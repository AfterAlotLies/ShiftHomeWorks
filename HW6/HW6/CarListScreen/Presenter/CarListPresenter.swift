//
//  CarListPresenter.swift
//  HW6
//
//  Created by Vyacheslav on 26.05.2024.
//

import Foundation
import UIKit

protocol ICarListPresenter {
    func didLoad(ui: ICarListViewController)
}

class CarListPresenter: ICarListPresenter {
    private weak var ui: ICarListViewController?
    private let networkManager: INetworkManager
    private let dataSource: ICarListViewDataSource
    
    private var carDetails = [MainCarModel]()
    
    init(networkManager: INetworkManager, dataSource: ICarListViewDataSource) {
        self.networkManager = networkManager
        self.dataSource = dataSource
    }
    
    func didLoad(ui: ICarListViewController) {
        self.ui = ui
        getCarDetail()
    }
    
    func setupNextController(passingData: MainCarModel) {
        let carInfoPresenter = CarInfoPresenter(carDetail: passingData)
        let carInfoDataSource = CarInfoViewDataSource()
        let carInfoViewController = CarInfoViewController(carInfoPresenter: carInfoPresenter,
                                                          dataSource: carInfoDataSource)
        ui?.showNextController(carInfoViewController)
    }
}

extension CarListPresenter {
    
    func getCarDetail() {
        networkManager.getCarInformation { [weak self] carDetails in
            guard let self = self else { return }
            self.carDetails = carDetails
            self.ui?.passCarData(dataModel: self.carDetails)
            self.dataSource.getCarInfo(carInfo: self.carDetails)
            self.ui?.reloadTableViewData()
        }
    }
}
