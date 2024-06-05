//
//  DataManager.swift
//  HW7
//
//  Created by Vyacheslav on 03.06.2024.
//

import UIKit

protocol IDataManager {
    func decodeData(imageData: Data) -> Result<String,Error>
}

class DataManager: IDataManager {
    
    func decodeData(imageData: Data) -> Result<String,Error> {
        do {
            let urlData = try JSONDecoder().decode(ImageModel.self, from: imageData)
            return .success(urlData.imageUrl)
        } catch {
            return .failure(error)
        }
    }
}
