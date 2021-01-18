//
//  MealDetailRouter.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

class MealDetailRouter: MealDetailRouterProtocol {

    class func createMealDetailModule(meal: Meal) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MealDetailView")
        if let view = navController as? MealDetailView {
            let presenter: MealDetailPresenterProtocol & MealDetailInteractorOutputProtocol = MealDetailPresenter()
            let interactor: MealDetailInteractorInputProtocol = MealDetailInteractor()
            let router: MealDetailRouterProtocol = MealDetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            presenter.meal = meal
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
