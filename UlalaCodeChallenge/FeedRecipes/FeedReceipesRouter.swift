//
//  FeedReceipesRouter.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

class FeedReceipesRouter: FeedReceipesRouterProtocol {

    class func createFeedReceipesModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navFeed")
        if let view = navController.children.first as? FeedReceipesView {
            let presenter: FeedReceipesPresenterProtocol & FeedReceipesInteractorOutputProtocol = FeedReceipesPresenter()
            let interactor: FeedReceipesInteractorInputProtocol = FeedReceipesInteractor()
            let router: FeedReceipesRouterProtocol = FeedReceipesRouter()
            
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
    
}
