//
//  main.swift
//  HW1
//
//  Created by Vyacheslav on 11.04.2024.
//

import Foundation

var carsData = [Car]()
let menu = "\n1. Добавить новый автомобиль\n2. Вывод добавленных автомобилей\n3. Найти автомобили по кузову\n4. Выйти\n"
print(menu)

while let userInteraction = readLine() {
    if userInteraction == "4" {
        break
    }
    switch userInteraction {
    case "1":
        addNewCar()
        print(menu)
    case "2":
        outputCarsData(inputArray: carsData)
        print(menu)
    case "3":
        outputCarByFilter()
        print(menu)
    default:
        print("Неизвестная команда, повторите ввод")
        print(menu)
    }
}

func addNewCar() {
    print("Введите производителя")
    let manufacturer = readLine()
    print("Введите модель")
    let model = readLine()
    print("Выберите тип кузова:\n1.Седан\n2.Купе\n3.Хэтчбэк\n4.Лифтбек\n5.Универсал")
    let carBody = CarBody.getBodyType(userChoice: Int(readLine() ?? "") ?? 0)
    print("Введите год выпуска(необязательно)")
    let yearOfIssue = Int(readLine() ?? "")
    print("Введите Гос.Номер(необязательно)")
    let carNubmer = readLine()
    carsData.append(Car.init(manufacturer: manufacturer != "" ? manufacturer ?? "" : "Никакой",
                             model: model != "" ? model ?? "" : "Никакая",
                             body: carBody,
                             yearOfIssue: yearOfIssue,
                             carNumber: carNubmer))
}

func outputCarByFilter() {
    print("Выберите кузов машины, которую хотите отобразить:\n1.Седан\n2.Купе\n3.Хэтчбэк\n4.Лифтбек\n5.Универсал")
    let carBodyType = CarBody.getBodyType(userChoice: Int(readLine() ?? "") ?? 0)
    let findedCars = carsData.filter { $0.body == carBodyType }
    outputCarsData(inputArray: findedCars)
}

func outputCarsData(inputArray: [Car]) {
    if inputArray.isEmpty {
        print("Пока нет добавленных машин")
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
