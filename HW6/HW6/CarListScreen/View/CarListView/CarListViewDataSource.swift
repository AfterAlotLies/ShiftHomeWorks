//
//  CarListViewDataSource.swift
//  HW6
//
//  Created by Vyacheslav on 26.05.2024.
//

import UIKit

protocol ICarListViewDataSource: UITableViewDataSource {
    func getCarInfo(carInfo: [MainCarModel])
}

class CarListViewDataSource: NSObject, ICarListViewDataSource {
    
    private var carInformation = [MainCarModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableViewCell.identifer, for: indexPath) as? CarListTableViewCell else {
            return UITableViewCell()
        }
        let markName = carInformation[indexPath.row]
        cell.setMarkNameToUI(data: CarListModel(markName: markName.markName))
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func getCarInfo(carInfo: [MainCarModel]) {
        carInformation = carInfo
    }
}
