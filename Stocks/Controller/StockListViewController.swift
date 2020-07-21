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

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let confirmedService = self.stockService else { return }
        confirmedService.getStocks(completion: {stocks, error in
            print(stocks)
            guard let stocks = stocks, error == nil else {
                let alert = UIAlertController(title: "Error", message: "\(error)" + ". \nRetry?", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Yes", style: .default) { (action) in
                self.viewDidLoad()
                self.viewWillAppear(true)
                }
            
            alert.addAction(OKAction)

            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            self.present(alert, animated: true)
                return
            }
            self.stock = stocks
            self.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmedCell = self.tableView.cellForRow(at: selectedIndexPath) as? StockCell
            else { return }
        
        let confirmedStock = confirmedCell.stock
        destination.stock = confirmedStock
        
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
        
        cell.stock = currentStock

        return cell
    }
}

extension StockListViewController: UITableViewDelegate {
    //mark: delegate
    /* swipe action
    func tableView(_ tableView:UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)->UISwipeActionsConfiguration? {
        let important = importantAction(at:indexPath)
        return UISwipeActionsConfiguration(actions: [important])
    }
    
    func importantAction(at indexPath: IndexPath) -> UIContextualAction {
        let cell =  self.tableView.cellForRow(at: indexPath) as? StockCell
        let confirmedStock = cell?.stock
        
        //make it go back and forth
        let title = confirmedStock!.favorite ?
          NSLocalizedString("Unfavorite", comment: "Unfavorite") :
          NSLocalizedString("Favorite", comment: "Favorite")
        let action = UIContextualAction(style: .normal, title: title) { (action, view, completion) in
            confirmedStock!.favorite = !confirmedStock!.favorite
            cell?.accessoryType = confirmedStock!.favorite ? .checkmark : .none
            completion(true)
        }

        action.backgroundColor = confirmedStock!.favorite ? .gray : .blue

        return action
    }
    */
}
    

