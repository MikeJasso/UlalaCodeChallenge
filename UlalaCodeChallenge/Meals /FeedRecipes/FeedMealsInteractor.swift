//
//  FeedReceipesInteractor.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation

class FeedMealsInteractor: FeedMealsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: FeedMealsInteractorOutputProtocol?
    
    func searchMeals(by: String) {
        NetworkManager.shared.fetchRequest(.getMeals(by: by)) { (result) in
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
