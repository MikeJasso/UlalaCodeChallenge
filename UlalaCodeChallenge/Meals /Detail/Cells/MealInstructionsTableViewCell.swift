//
//  MealInstructionsTableViewCell.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import UIKit

class MealLabelTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var instructionsTextView: UILabel!
    
    var _instructions: String = ""
    var instructions: String? {
        set {
            _instructions = newValue ?? ""
            config()
        }
        
        get { return _instructions }
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
        instructionsTextView.text = instructions
    }
    
    override func prepareForReuse() {
        instructionsTextView.text = ""
    }
    
}
