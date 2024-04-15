//
//  CarBody.swift
//  HW1
//
//  Created by Vyacheslav on 12.04.2024.
//

import Foundation

enum CarBody: String, CaseIterable {
    case sedan = "Седан"
    case coupe = "Купе"
    case hatchback = "Хэтчбэк"
    case liftback = "Лифтбек"
    case combi = "Универсал"
    case unknown = "Неизвестный"
    
    static func getBodyType(userChoice: Int) -> CarBody {
        switch userChoice {
        case 1:
            return .sedan
        case 2:
            return .coupe
        case 3:
            return .hatchback
        case 4:
            return .liftback
        case 5:
            return .combi
        default:
            return .unknown
        }
    }
}
