//
//  ImageModel.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import Foundation

struct ImageModel: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "message"
    }
    
    let imageUrl: String
}
