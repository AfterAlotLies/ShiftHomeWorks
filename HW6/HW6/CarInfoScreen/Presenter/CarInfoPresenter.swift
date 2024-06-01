//
//  CarInfoPresenter.swift
//  HW6
//
//  Created by Vyacheslav on 27.05.2024.
//

import Foundation

protocol ICarInfoPresenter {
    func didLoad(ui: ICarInfoViewController)
}

class CarInfoPresenter: ICarInfoPresenter {
    private var carDetail: MainCarModel
    private weak var ui: ICarInfoViewController?
    
    init(carDetail: MainCarModel) {
        self.carDetail = carDetail
    }
    
    func didLoad(ui: ICarInfoViewController) {
        self.ui = ui
        ui.setupCarData(dataModel: convertDataModel(carDetail))
    }
    
    func setUpdatedCarData(data: CarInfoModel, choosenIndex: Int) {
        ui?.updateCarImage(carImageName: data.markNameImage,
                                   choosenCell: choosenIndex)
        ui?.updateCarPrice(carPrice: data.carPrice)
    }
}

private extension CarInfoPresenter {
    
    func convertDataModel(_ dataModel: MainCarModel) -> [CarInfoModel] {
        dataModel.carDetail.map { detail in
            CarInfoModel(markNameImage: detail.markNameImage,
                         carPrice: detail.carPrice,
                         carBody: detail.carType)
        }
    }
}
