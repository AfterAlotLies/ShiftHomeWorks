//
//  MainPresenter.swift
//  HW7
//
//  Created by Vyacheslav on 02.06.2024.
//

import Foundation

protocol IMainPresenter {
    func didLoad(ui: IMainViewController, findDog: String)
    func hideKeyboardOnScreenTap(ui: IMainViewController)
    
}

class MainPresenter: IMainPresenter {
    private weak var ui: IMainViewController?
    private let networkManager: INetworkManager
    private let dataManager: IDataManager
    private let dataSource: IMainTableViewDataSource
    
    init(networkManager: INetworkManager, dataSource: IMainTableViewDataSource, dataManager: IDataManager) {
        self.networkManager = networkManager
        self.dataSource = dataSource
        self.dataManager = dataManager
    }
    
    func didLoad(ui: IMainViewController, findDog: String) {
        self.ui = ui
        makeRequest(findDog: findDog)
    }
    
    func hideKeyboardOnScreenTap(ui: IMainViewController) {
        self.ui = ui
        ui.hideKeyboard()
    }
    
}

private extension MainPresenter {
    
    func makeRequest(findDog: String) {
        networkManager.makeRequest(keyWord: findDog) { [weak self] result in
            guard let self = self else { return }
            switch result {

            case .success(let imageUrl):
                let imageUrl = dataManager.decodeData(imageData: imageUrl)
                switch imageUrl {

                    case .success(let imageUrlString):
                        networkManager.getImageFromUrl(imageUrl: imageUrlString) { result in
                            switch result {

                                case .success(let data):
                                    self.dataSource.addNewImage(imageData: data)
                                    DispatchQueue.main.async {
                                        self.ui?.reloadTableView()
                                    }

                                case .failure(let error):
                                    DispatchQueue.main.async {
                                        self.ui?.showErrorAlert(error: error)
                                    }
                            }
                    }

                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.ui?.showErrorAlert(error: error)
                        }
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self.ui?.showErrorAlert(error: error)
                }
            }
        }
    }

}
