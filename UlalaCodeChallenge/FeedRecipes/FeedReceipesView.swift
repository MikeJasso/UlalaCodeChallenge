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
    var meals: Meals?
    lazy var searchBar:UISearchBar = UISearchBar()

    
    @IBOutlet weak var mealsTableView: UITableView!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getMeals(by: "a")
        presenter?.viewDidLoad()
    }
}

extension FeedReceipesView: FeedReceipesViewProtocol {
    // TODO: implement view output methods
    
    func configViews() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search receipe..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        mealsTableView.tableHeaderView = searchBar
    }
    
    func show(meals: Meals) {
        self.meals = meals
        DispatchQueue.main.async {
            self.mealsTableView.reloadData()
        }
    }
    
    func showErrorAlert(error: String) {
        print(error)
    }
}

extension FeedReceipesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let meals = meals?.meals else {
            return 1
        }
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let meal = meals?.meals?[indexPath.row] else {
             let cell = UITableViewCell()
             cell.textLabel?.text = "noinfo".localized
             cell.textLabel?.textAlignment = .center
             return cell
         }
         let cell: FeedMealTableViewCell = mealsTableView.dequeueReusableCell(for: indexPath)
        cell.textLabel?.text = meal.strMeal
         return cell
    }
    
    private func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UITableViewCell()
    }
}

extension FeedMealTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension FeedReceipesView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.getMeals(by: searchText)
    }
}
