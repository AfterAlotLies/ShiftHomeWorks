//
//  CarInfoViewDataSource.swift
//  HW6
//
//  Created by Vyacheslav on 27.05.2024.
//

import UIKit

protocol ICarInfoViewDataSource: UITableViewDataSource {
    func setCarBodyTypeData(bodyType: [BodyType])
    func setChoosenCellIndex(_ index: Int)
}

class CarInfoViewDataSource: NSObject, ICarInfoViewDataSource {
    
    private var carBodyTypeArray = [BodyType]()
    private var choosenCell = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carBodyTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarInfoTableViewCell.identifer, for: indexPath) as? CarInfoTableViewCell else {
            return UITableViewCell()
        }
        let cellData = carBodyTypeArray[indexPath.row]
        cell.setTypeToCell(type: cellData.rawValue)
        
        if choosenCell == indexPath.row {
            cell.setImageToSelectedCell()
        } else {
            cell.setDefaultImageToCell()
        }
        return cell
    }
    
    func setCarBodyTypeData(bodyType: [BodyType]) {
        carBodyTypeArray = bodyType
    }
    
    func setChoosenCellIndex(_ index: Int) {
        choosenCell = index
    }
    
}
