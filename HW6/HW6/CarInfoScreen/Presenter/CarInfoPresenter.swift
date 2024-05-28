//
//  CarInfoPresenter.swift
//  HW6
//
//  Created by Vyacheslav on 27.05.2024.
//

import Foundation

protocol ICarInfoPresenter {
    func didLoad(controller: ICarInfoViewController)
}

class CarInfoPresenter: ICarInfoPresenter {
    private var carDetail: MainCarModel
    private weak var controller: ICarInfoViewController?
    
    init(carDetail: MainCarModel) {
        self.carDetail = carDetail
    }
    
    func didLoad(controller: ICarInfoViewController) {
        self.controller = controller
        controller.setupCarData(dataModel: convertDataModel(carDetail))
    }
    
    func setUpdatedCarData(data: CarInfoModel, choosenIndex: Int) {
        controller?.updateCarImage(carImageName: data.markNameImage,
                                   choosenCell: choosenIndex)
        controller?.updateCarPrice(carPrice: data.carPrice)
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
