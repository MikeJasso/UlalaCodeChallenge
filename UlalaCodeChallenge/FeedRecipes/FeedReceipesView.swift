//
//  FeedReceipesView.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

class FeedReceipesView: UIViewController {

    // MARK: Properties
    var presenter: FeedReceipesPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getMeals(by: "a")
    }
}

extension FeedReceipesView: FeedReceipesViewProtocol {
    // TODO: implement view output methods
    
    func show(meals: Meals) {
        print(meals)
    }
    
    func showErrorAlert(error: String) {
        print(error)
    }
}
