//
//  CarListPresenter.swift
//  HW6
//
//  Created by Vyacheslav on 26.05.2024.
//

import Foundation
import UIKit

protocol ICarListPresenter {
    func fetchData(controller: ICarListViewController)
}

class CarListPresenter: ICarListPresenter {
    private weak var controller: ICarListViewController?
    private let networkManager: INetworkManager
    
    private var carDetails = [MainCarModel]()
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchData(controller: ICarListViewController) {
        self.controller = controller
        getCarDetail()
    }
    
    func setupNextController(passingData: MainCarModel) {
        let carInfoPresenter = CarInfoPresenter(carDetail: passingData)
        let carInfoDataSource = CarInfoViewDataSource()
        let carInfoViewController = CarInfoViewController(carInfoPresenter: carInfoPresenter,
                                                          dataSource: carInfoDataSource)
        controller?.showNextController(carInfoViewController)
    }
}

extension CarListPresenter {
    
    func getCarDetail() {
        networkManager.getCarInformation { [weak self] carDetails in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.carDetails = carDetails
                self.controller?.passCarData(dataModel: self.carDetails)
            }
        }
    }
}
