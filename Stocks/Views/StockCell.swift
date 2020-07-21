//
//  StockCell.swift
//  Stocks
//
//  Created by Shixian Fang on 7/4/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {


    @IBOutlet weak var stockImageView: UIImageView!
    @IBOutlet weak var StockNameLabel: UILabel!
    @IBOutlet weak var StockCodeLabel: UILabel!
    
    var stock: Stock? {
        // using accessoryTyoe to show whether the stock is favorite
        didSet {
            self.StockNameLabel.text = stock?.name
            self.StockCodeLabel.text = stock?.code
            //self.accessoryType = stock!.favorite ? .checkmark : .none
            
            DispatchQueue.global(qos: .userInitiated).async {
                let stockImageData = NSData(contentsOf: URL(string: self.stock!.imageUrl)!)
                DispatchQueue.main.async {
           //If we get imageUrl, we use it. If not, we use default picture
                    if stockImageData != nil {
                        self.stockImageView.image = UIImage(data: stockImageData as! Data)}
                    else {
                        self.stockImageView.image = UIImage(systemName: "multiply.circle.fill")
                    }
                    self.stockImageView.layer.cornerRadius = self.stockImageView.frame.width / 2
                    
                }
            }
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

}
