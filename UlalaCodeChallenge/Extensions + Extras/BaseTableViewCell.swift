//
//  BaseTableViewCell.swift
//  UlalaCodeChallenge
//
//  Created by MiguelJasso on 17/01/21.
//  Copyright © 2021 MikeJasso. All rights reserved.
//

import UIKit

protocol BaseCell {
    func config()
}

class BaseTableViewCell: UITableViewCell, ReusableView, NibLoadableView, BaseCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        
    }
    
    override func prepareForReuse() {
        
    }

}
