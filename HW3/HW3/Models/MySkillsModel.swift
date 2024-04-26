//
//  MySkillsModel.swift
//  HW3
//
//  Created by Vyacheslav on 26.04.2024.
//

import Foundation

enum SkillsModel: String {
    case introductionLabel = "Мои навыки разработчика"
    case buttonTitle = "Ознакомился!"
}

enum SkillsDescription: String, CaseIterable {
    case yearEducation = "- Обучаюсь программированию с 10 класса"
    case language = "- Первыми языками были C и C++"
    case swiftYearEducation = "- Swift изучаю на протяжении 8 месяцев"
    case expectations = "- От обучения ожидаю информации, которая пригодится в будущем для работы"
}
