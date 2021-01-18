//
//  FeedMealTableViewCell.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import UIKit
import Kingfisher

class FeedMealTableViewCell: BaseTableViewCell  {
    
    // MARK: Properties
    @IBOutlet weak var mealImage : UIImageView!
    @IBOutlet weak var nameMealLabel: UILabel!
    @IBOutlet weak var categoryMealLabel: UILabel!
    
    var meal: Meal? {
        didSet {
            config()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func config() {
        guard let meal = self.meal else {
            return
        }
        nameMealLabel.text = meal.strMeal
        categoryMealLabel.text = meal.strCategory
        let url = URL(string: meal.strSource ?? "")
        mealImage.kf.setImage(with: url)

    }
    
    override func prepareForReuse() {
        mealImage.image = nil
        nameMealLabel.text = ""
        categoryMealLabel.text = ""
    }
}
