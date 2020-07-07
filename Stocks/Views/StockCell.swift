//
//  StockCell.swift
//  Stocks
//
//  Created by Shixian Fang on 7/4/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {

    @IBOutlet weak var StockNameLabel: UILabel!
    
    @IBOutlet weak var StockCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
