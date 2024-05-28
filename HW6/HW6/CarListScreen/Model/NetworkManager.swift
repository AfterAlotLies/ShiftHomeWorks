//
//  NetworkManager.swift
//  HW6
//
//  Created by Vyacheslav on 26.05.2024.
//

import Foundation

protocol INetworkManager {
    func getCarInformation(completion: @escaping (([MainCarModel]) -> Void))
}

class NetworkManager: INetworkManager {
    
    func getCarInformation(completion: @escaping (([MainCarModel]) -> Void)) {
        completion (
            [
                MainCarModel(markName: "BMW",
                                       carDetail: [
                                        CarDetail(markNameImage: "BMW_Coupe",
                                                  carPrice: 20000,
                                                  carType: .coupe),
                                        CarDetail(markNameImage: "BMW_Sedan",
                                                  carPrice: 131321,
                                                  carType: .sedan),
                                        CarDetail(markNameImage: "BMW_Van",
                                                  carPrice: 132132,
                                                  carType: .van),
                                        CarDetail(markNameImage: "BMW_Estate",
                                                  carPrice: 312321,
                                                  carType: .estate)
                                       ]
                            ),
                MainCarModel(markName: "Mercedes", 
                             carDetail: [
                                CarDetail(markNameImage: "Mercedes_Coupe",
                                          carPrice: 12321,
                                          carType: .coupe),
                                CarDetail(markNameImage: "Mercedes_Sedan",
                                          carPrice: 13213,
                                          carType: .sedan),
                                CarDetail(markNameImage: "Mercedes_Van",
                                          carPrice: 31233,
                                          carType: .van),
                                CarDetail(markNameImage: "Mercedes_Estate",
                                          carPrice: 312321,
                                          carType: .estate)
                             ]
                            ),
                MainCarModel(markName: "Audi", 
                             carDetail: [
                                CarDetail(markNameImage: "Audi_Coupe",
                                          carPrice: 312321,
                                          carType: .coupe),
                                CarDetail(markNameImage: "Audi_Sedan", 
                                          carPrice: 111111,
                                          carType: .sedan),
                                CarDetail(markNameImage: "Audi_Van",
                                          carPrice: 382918,
                                          carType: .van),
                                CarDetail(markNameImage: "Audi_Estate",
                                          carPrice: 77777,
                                          carType: .estate)
                             ]
                            ),
                MainCarModel(markName: "Toyota", 
                             carDetail: [
                    CarDetail(markNameImage: "Toyota_Coupe",
                              carPrice: 321321,
                              carType: .coupe),
                    CarDetail(markNameImage: "Toyota_Sedan",
                              carPrice: 432432,
                              carType: .sedan),
                    CarDetail(markNameImage: "Toyota_Van",
                              carPrice: 312321,
                              carType: .van),
                    CarDetail(markNameImage: "Toyota_Estate",
                              carPrice: 543321,
                              carType: .estate)
                             ]
                            ),
                MainCarModel(markName: "Lexus",
                             carDetail: [
                                CarDetail(markNameImage: "Lexus_Coupe",
                                          carPrice: 312312,
                                          carType: .coupe),
                                CarDetail(markNameImage: "Lexus_Sedan",
                                          carPrice: 313213,
                                          carType: .sedan),
                                CarDetail(markNameImage: "Lexus_Van",
                                          carPrice: 321321,
                                          carType: .van),
                                CarDetail(markNameImage: "Lexus_Estate",
                                          carPrice: 421432,
                                          carType: .estate)
                             ]
                            )
            ]
        )
    }
}
