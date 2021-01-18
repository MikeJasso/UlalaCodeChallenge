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

    // MARK: Properties
    var presenter: MealDetailPresenterProtocol?
    var meal: Meal!
    
    @IBOutlet weak var detailTableView: UITableView!

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
        DispatchQueue.main.async {
            self.detailTableView.reloadData()
        }
    }
}

extension MealDetailView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let meal = meal else {
            return 1
        }
        switch section {
        case 0:
            return 1
        case 1:
            return 0
        default:
           return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let meal = meal else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "noInfo".localized
            cell.textLabel?.textAlignment = .center
            return cell
        }
        switch indexPath.section {
        case 0:
            let cell: MealLabelTableViewCell = detailTableView.dequeueReusableCell(for: indexPath)
            cell.txt = meal.strInstructions ?? ""
            return cell
        case 1:
            let cell: MealLabelTableViewCell = detailTableView.dequeueReusableCell(for: indexPath)
            cell.txt = meal.strInstructions ?? ""
            return cell
        default: return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Instructions"
        }
        return "Ingredientes"
    }
}

extension MealDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


