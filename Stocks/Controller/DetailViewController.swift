//
//  DetailViewController.swift
//  Stocks
//
//  Created by Shixian Fang on 7/11/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var stock: Stock!
    @IBOutlet weak var CompanyImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var IndustryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(stock)
        self.NameLabel.text = stock.name
        self.PriceLabel.text = stock.price
        self.IndustryLabel.text = stock.industry
        DispatchQueue.global(qos: .userInitiated).async {
            let stockImageData = NSData(contentsOf: URL(string: self.stock!.imageUrl)!)
            DispatchQueue.main.async {
                self.CompanyImageView.image = UIImage(data: stockImageData as! Data)
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
