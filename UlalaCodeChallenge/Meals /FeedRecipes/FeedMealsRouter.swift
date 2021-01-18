//
//  FeedReceipesRouter.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

class FeedMealsRouter: FeedMealsRouterProtocol {
        
    class func createFeedMealsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navFeed")
        if let view = navController.children.first as? FeedMealsView {
            let presenter: FeedMealsPresenterProtocol & FeedMealsInteractorOutputProtocol = FeedMealsPresenter()
            let interactor: FeedMealsInteractorInputProtocol = FeedMealsInteractor()
            let router: FeedMealsRouterProtocol = FeedMealsRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentDetailViewFor(meal: Meal) {
        let detailView = MealDetailRouter.createMealDetailModule(meal: meal)
        let topView = UIApplication.getTopViewController()
        topView?.show(detailView, sender: self)
    }
}
