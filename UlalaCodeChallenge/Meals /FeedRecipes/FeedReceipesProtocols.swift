//
//  FeedReceipesProtocols.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

protocol FeedMealsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: FeedMealsPresenterProtocol? { get set }
    
    func configViews()
    func show(meals: Meals)
    func showErrorAlert(error: String)
}

protocol FeedMealsRouterProtocol: class {
    // PRESENTER -> Router
    static func createFeedMealsModule() -> UIViewController
    func presentDetailViewFor(meal: Meal)
}

protocol FeedMealsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: FeedMealsViewProtocol? { get set }
    var interactor: FeedMealsInteractorInputProtocol? { get set }
    var router: FeedMealsRouterProtocol? { get set }
    
    func viewDidLoad()
    func getMeals(by: String)
    func showDetailFor(meal: Meal)
}

protocol FeedMealsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func show(meals: Meals)
    func showErrorAlert(error: String)
}

protocol FeedMealsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: FeedMealsInteractorOutputProtocol? { get set }
    
    func searchMeals(by: String)
}
