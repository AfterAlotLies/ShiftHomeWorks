//
//  Presenter.swift
//  HW5
//
//  Created by Vyacheslav on 19.05.2024.
//

import Foundation

protocol IPresenter {
    func didLoad(ui: IHeroInformationViewController)
    func willLayoutSubviews(ui: IHeroInformationViewController)
}

class Presenter: IPresenter {
    
    private weak var ui: IHeroInformationViewController?
    private let heroInfo: HeroesListModel
    
    init(heroInfo: HeroesListModel) {
        self.heroInfo = heroInfo
    }
    
    func didLoad(ui: IHeroInformationViewController) {
        self.ui = ui
        ui.setUI(model: HeroInformationModel(heroNameImage: heroInfo.heroNameImage,
                                             heroName: heroInfo.heroName,
                                             heroPosition: heroInfo.heroPosition,
                                             heroStrength: heroInfo.heroStrength,
                                             heroAgility: heroInfo.heroAgility,
                                             heroIntelligence: heroInfo.heroIntelligence,
                                             description: heroInfo.description))
    }
    
    func willLayoutSubviews(ui: IHeroInformationViewController) {
        self.ui = ui
        ui.updateUIContent()
    }
    
    func showModalViewController() {
        let heroComplexityController = HeroComplexityViewController(viewModel: ViewModel(complexityHero: HeroComplexityModel(complexity: heroInfo.complexity.rawValue)))
        self.ui?.setupModalPresentationAction(heroComplexityController)
    }
}

