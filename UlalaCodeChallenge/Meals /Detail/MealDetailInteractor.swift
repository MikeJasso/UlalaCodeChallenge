//
//  MealDetailInteractor.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import Foundation

class MealDetailInteractor: MealDetailInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: MealDetailInteractorOutputProtocol?
    
    func ingredients(meal: Meal) -> [String?] {
        
        let ing = [meal.strIngredient1, meal.strIngredient2, meal.strIngredient3, meal.strIngredient4, meal.strIngredient5, meal.strIngredient6, meal.strIngredient7, meal.strIngredient8, meal.strIngredient9, meal.strIngredient10, meal.strIngredient11, meal.strIngredient12, meal.strIngredient13, meal.strIngredient14, meal.strIngredient15, meal.strIngredient16, meal.strIngredient17, meal.strIngredient18, meal.strIngredient19, meal.strIngredient20]
        return ing.filter({$0 != ""})
    }
}
