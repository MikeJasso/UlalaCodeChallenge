//
//  MealDetailPresenter.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation

class MealDetailPresenter  {
    
    // MARK: Properties
    weak var view: MealDetailViewProtocol?
    var interactor: MealDetailInteractorInputProtocol?
    var router: MealDetailRouterProtocol?
    var meal: Meal?

}

extension MealDetailPresenter: MealDetailPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        guard let meal = self.meal else {
            return
        }
        view?.update(meal: meal)
    }
    
    func ingredients() -> [String?] {
        guard let meal = meal else {
            return []
        }
        return interactor?.ingredients(meal: meal) ?? []
    }
}

extension MealDetailPresenter: MealDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
