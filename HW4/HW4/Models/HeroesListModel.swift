//
//  HeroesListModel.swift
//  HW4
//
//  Created by Vyacheslav on 06.05.2024.
//

import Foundation

struct HeroesListModel {
    
    enum HeroPositions: String {
        case midLine = "Mid line"
        case safeLine = "Safe line"
        case offlaneLine = "Offlane line"
        case roaming = "Roaming"
        case support = "Support"
    }
    
    enum HeroComplexity: String {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
        case veryHard = "Very hard"
    }
    
    let heroNameImage: String
    let heroName: String
    let heroPosition: HeroPositions
    let heroStrength: Int
    let heroAgility: Int
    let heroIntelligence: Int
    let description: String
    let complexity: HeroComplexity
}
