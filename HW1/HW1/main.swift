//
//  main.swift
//  HW1
//
//  Created by Vyacheslav on 11.04.2024.
//

import Foundation

var carsData = [Car]()
outputMenu()

while let userInteraction = readLine() {
    if userInteraction == "4" {
        break
    }
    switch userInteraction {
    case "1":
        addNewCar()
        outputMenu()
    case "2":
        outputCarsData(inputArray: carsData)
        outputMenu()
    case "3":
        outputCarByFilter()
        outputMenu()
    default:
        print("Неизвестная команда, повторите ввод")
        outputMenu()
    }
}

func addNewCar() {
    print("Введите производителя")
    guard let manufacturer = readLine(), !manufacturer.isEmpty else {
        print("Производитель не может быть пустым\n")
        return
    }
    
    print("Введите модель")
    guard let model = readLine(), !model.isEmpty else {
        print("Модель не может быть пустой\n")
        return
    }
    
    outputCarBodyTypes()
    let carBody = CarBody.getBodyType(userChoice: Int(readLine() ?? "") ?? 0)
    print("Введите год выпуска(необязательно)")
    let yearOfIssue = Int(readLine() ?? "")
    print("Введите Гос.Номер(необязательно)")
    let carNubmer = readLine()
    carsData.append(Car.init(manufacturer: manufacturer,
                             model: model,
                             body: carBody,
                             yearOfIssue: yearOfIssue,
                             carNumber: carNubmer))
}

func outputCarByFilter() {
    outputCarBodyTypes()
    let carBodyType = CarBody.getBodyType(userChoice: Int(readLine() ?? "") ?? 0)
    let findedCars = carsData.filter { $0.body == carBodyType }
    outputCarsData(inputArray: findedCars)
}

func outputCarsData(inputArray: [Car]) {
    if inputArray.isEmpty {
        print("Пока нет добавленных машин\n")
    } else {
        for (index, carData) in inputArray.enumerated() {
            print("\n#\(index + 1).")
            print("Производитель: \(carData.manufacturer)")
            print("Модель: \(carData.model)")
            print("Тип кузова: \(carData.body.rawValue)")
            
            if let yearOfIssues = carData.yearOfIssue {
                print("Год выпуска: \(yearOfIssues)")
            } else {
                print("Год выпуска: -")
            }
            if let carNumber = carData.carNumber, carNumber != "" {
                print("Гос. Номер: \(carNumber)")
            }
        }
    }
}

func outputMenu() {
    MenuActions.allCases.forEach {
        print($0.rawValue)
    }
}

func outputCarBodyTypes() {
    print("Выберите тип кузова:")
    CarBody.allCases.dropLast(1).enumerated().forEach { (index, bodyType) in
        print("\(index + 1).\(bodyType.rawValue)")
    }
}
