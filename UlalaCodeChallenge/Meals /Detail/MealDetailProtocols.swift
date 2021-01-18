//
//  MealDetailProtocols.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

protocol MealDetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MealDetailPresenterProtocol? { get set }
    
    func update(meal: Meal)
}

protocol MealDetailRouterProtocol: class {
    // PRESENTER -> Router
    static func createMealDetailModule(meal: Meal) -> UIViewController
}

protocol MealDetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MealDetailViewProtocol? { get set }
    var interactor: MealDetailInteractorInputProtocol? { get set }
    var router: MealDetailRouterProtocol? { get set }
    var meal: Meal? { get set }
    
    func viewDidLoad()
    func ingredients() -> [String?]

}

protocol MealDetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol MealDetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MealDetailInteractorOutputProtocol? { get set }
    
    func ingredients(meal: Meal) -> [String?]
}
