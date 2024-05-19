//
//  HeroesListModel.swift
//  HW5
//
//  Created by Vyacheslav on 06.05.2024.
//

import Foundation

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

struct HeroesListModel {
    let heroNameImage: String
    let heroName: String
    let heroPosition: HeroPositions
    let heroStrength: Int
    let heroAgility: Int
    let heroIntelligence: Int
    let description: String
    let complexity: HeroComplexity
}
