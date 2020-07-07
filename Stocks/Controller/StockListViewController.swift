//
//  ViewController.swift
//  Stocks
//
//  Created by Shixian Fang on 7/3/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import UIKit

class StockListViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var stock: [Stock] = []
    var stockService: StockService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.stockService = StockService()
        self.stock = stockService.getStocks()
    
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    
}

extension StockListViewController: UITableViewDataSource {

    //Mark:Date Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stock.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "stockCell") as! StockCell
        
        let currentStock=self.stock[indexPath.row]
        cell.StockNameLabel.text = currentStock.name
        cell.StockCodeLabel.text = currentStock.code
        
        return cell
    }
}

extension StockListViewController: UITableViewDelegate {
        
}
