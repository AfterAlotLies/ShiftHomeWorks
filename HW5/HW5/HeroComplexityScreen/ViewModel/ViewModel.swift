//
//  ViewModel.swift
//  HW5
//
//  Created by Vyacheslav on 19.05.2024.
//

import Foundation

protocol IViewModel: AnyObject {
    func setComplexityLabel(complexity: HeroComplexityModel)
}

class ViewModel {
    
    private var timer: Timer?
    
    private var complexityHero: HeroComplexityModel {
        didSet {
            delegate?.setComplexityLabel(complexity: complexityHero)
        }
    }
    
    weak var delegate: IViewModel? {
        didSet {
            delegate?.setComplexityLabel(complexity: complexityHero)
        }
    }
    
    init(complexityHero: HeroComplexityModel) {
        self.complexityHero = complexityHero
        setupRandomTimer()
    }
}

// MARK: - Private methods
private extension ViewModel {
    
    func setupRandomTimer() {
        let randomInterval = Double.random(in: 1...5)
        timer = Timer.scheduledTimer(timeInterval: randomInterval, target: self, selector: #selector(updateComplexityData), userInfo: nil, repeats: true)
    }
    
    @objc
    func updateComplexityData() {
        let newComplexity = HeroComplexityModel(complexity: "Updated Complexity: \(Int.random(in: 1...100))")
        complexityHero = newComplexity
        setupRandomTimer()
    }
}

