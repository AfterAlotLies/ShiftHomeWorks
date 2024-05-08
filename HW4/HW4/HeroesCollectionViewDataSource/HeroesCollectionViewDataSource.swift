//
//  HeroesCollectionViewDataSource.swift
//  HW4
//
//  Created by Vyacheslav on 06.05.2024.
//

import UIKit

class HeroesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var mokoData = DataManager.createMoko()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.createMoko().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.identifer, for: indexPath) as? HeroesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setDataToCell(data: mokoData[indexPath.item])
        
        return cell
    }
    
}
