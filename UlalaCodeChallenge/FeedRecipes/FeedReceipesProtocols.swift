//
//  FeedReceipesProtocols.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

protocol FeedReceipesViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: FeedReceipesPresenterProtocol? { get set }
    
    func show(meals: Meals)
    func showErrorAlert(error: String)
}

protocol FeedReceipesRouterProtocol: class {
    // PRESENTER -> Router
    static func createFeedReceipesModule() -> UIViewController
}

protocol FeedReceipesPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: FeedReceipesViewProtocol? { get set }
    var interactor: FeedReceipesInteractorInputProtocol? { get set }
    var router: FeedReceipesRouterProtocol? { get set }
    
    func viewDidLoad()
    func getMeals(by: String)
}

protocol FeedReceipesInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func show(meals: Meals)
    func showErrorAlert(error: String)
}

protocol FeedReceipesInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: FeedReceipesInteractorOutputProtocol? { get set }
    
    func searchMeals(by: String)
}
