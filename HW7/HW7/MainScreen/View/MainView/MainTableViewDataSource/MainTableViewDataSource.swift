//
//  MainTableViewDataSource.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import UIKit

protocol IDataProvider {
    func addNewImage(imageData: Data)
}

protocol IMainTableViewDataSource: UITableViewDataSource, IDataProvider {}

class MainTableViewDataSource: NSObject, IMainTableViewDataSource {
    
    private var imagesArray = [UIImage]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifer, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setImage(imagesArray[indexPath.row])
        
        return cell
    }
    
    func addNewImage(imageData: Data) {
        let image = UIImage(data: imageData)
        if let image = image {
            imagesArray.append(image)
        }
    }
}
