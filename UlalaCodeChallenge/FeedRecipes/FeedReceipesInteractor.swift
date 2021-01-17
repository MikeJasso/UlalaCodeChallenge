//
//  FeedReceipesInteractor.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation

class FeedReceipesInteractor: FeedReceipesInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: FeedReceipesInteractorOutputProtocol?
    
    func searchMeals(by: String) {
        NetworkManager.shared.fetchRequest(.getReceipes(by: by)) { (result) in
            let decoder = JSONDecoder()
            switch result {
            case .success(let data):
                if let meals = try? decoder.decode(Meals.self, from: data) {
                    self.presenter?.show(meals: meals)
                } else {
                    self.presenter?.showErrorAlert(error: "Error")
                }
            case .failed(let error):
                self.presenter?.showErrorAlert(error: error?.description ?? "Error")
            }
        }
    }

}
