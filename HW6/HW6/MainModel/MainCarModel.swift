//
//  MainCarModel.swift
//  HW6
//
//  Created by Vyacheslav on 24.05.2024.
//

import Foundation

enum BodyType: String {
    case sedan = "Седан"
    case van = "Фургон"
    case estate = "Универсал"
    case coupe = "Купе"
}

struct MainCarModel {
    let markName: String
    let carDetail: [CarDetail]
}

struct CarDetail {
    let markNameImage: String
    let carPrice: Int
    let carType: BodyType
}
