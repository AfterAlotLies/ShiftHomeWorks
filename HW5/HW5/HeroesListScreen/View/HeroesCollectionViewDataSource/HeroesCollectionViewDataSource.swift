//
//  HeroesCollectionViewDataSource.swift
//  HW5
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

class HeroesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var heroesData = [HeroesListModel]()
    
    func getHeroesData() {
        heroesData = DataManager.createMockData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.identifer, for: indexPath) as? HeroesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let heroData = heroesData[indexPath.item]
        cell.setDataToCell(data: HeroesCollectionModel(heroNameImage: heroData.heroNameImage,
                                                       heroName: heroData.heroName,
                                                       heroPosition: heroData.heroPosition,
                                                       heroStrength: heroData.heroStrength,
                                                       heroAgility: heroData.heroAgility,
                                                       heroIntelligence: heroData.heroIntelligence)
        )
        
        return cell
    }
    
}
