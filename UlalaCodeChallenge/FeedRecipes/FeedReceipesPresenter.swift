//
//  FeedReceipesPresenter.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation

class FeedReceipesPresenter  {
    
    // MARK: Properties
    weak var view: FeedReceipesViewProtocol?
    var interactor: FeedReceipesInteractorInputProtocol?
    var router: FeedReceipesRouterProtocol?
    
}

extension FeedReceipesPresenter: FeedReceipesPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() { }
    
    func getMeals(by: String) {
        interactor?.searchMeals(by: by)
    }
}

extension FeedReceipesPresenter: FeedReceipesInteractorOutputProtocol {
    func show(meals: Meals) {
        view?.show(meals: meals)
    }
    
    func showErrorAlert(error: String) {
        view?.showErrorAlert(error: error)
    }
    
    // TODO: implement interactor output methods
}
