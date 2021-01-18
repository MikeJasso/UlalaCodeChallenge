//
//  FeedReceipesPresenter.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation

class FeedMealsPresenter  {
    
    // MARK: Properties
    weak var view: FeedMealsViewProtocol?
    var interactor: FeedMealsInteractorInputProtocol?
    var router: FeedMealsRouterProtocol?
    
}

extension FeedMealsPresenter: FeedReceipesPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.configViews()
    }
    
    func getMeals(by: String) {
        interactor?.searchMeals(by: by)
    }
}

extension FeedMealsPresenter: FeedReceipesInteractorOutputProtocol {
    func show(meals: Meals) {
        view?.show(meals: meals)
    }
    
    func showErrorAlert(error: String) {
        view?.showErrorAlert(error: error)
    }
    
    // TODO: implement interactor output methods
}
