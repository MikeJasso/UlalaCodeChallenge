//
//  MealDetailView.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation
import UIKit

class MealDetailView: UIViewController {
    
    var meal: Meal!

    // MARK: Properties
    var presenter: MealDetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension MealDetailView: MealDetailViewProtocol {
    // TODO: implement view output methods
    func update(meal: Meal) {
        self.meal = meal
        self.title = meal.strMeal
    }
}
