//
//  DataManager.swift
//  HW7
//
//  Created by Vyacheslav on 03.06.2024.
//

import UIKit

protocol IDataManager {
    func decodeData(imageData: Data) -> String
}

class DataManager: IDataManager {
    
    func decodeData(imageData: Data) -> String {
        do {
            let urlData = try JSONDecoder().decode(ImageModel.self, from: imageData)
            return urlData.imageUrl
        } catch {
            print("error")
        }
        return ""
    }
}
