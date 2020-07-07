//
//  BirdService.swift
//  Stocks
//
//  Created by Shixian Fang on 7/5/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import Foundation

class StockService {
    func getStocks() -> [Stock] {
        return [
            Stock(named: "Apple", code: "AAPL"),
            Stock(named: "Amazon", code:"AMZN"),
            Stock(named: "Alphabet", code:"GOOG" ),
            Stock(named: "Facebook", code: "FB"),
            Stock(named: "NVIDIA", code: "FB"),
            Stock(named: "Tesla", code: "TSLA"),
            Stock(named: "NetFlex", code: "NFLX"),
            Stock(named: "Slack", code: "WORK"),
            Stock(named: "Zoom", code: "ZM"),
            Stock(named: "Microsoft", code: "MSFT"),
            Stock(named: "AMD", code: "AMD"),
            Stock(named:"Intel", code: "Intel"),
            Stock(named: "Alibaba", code: "BABA"),
            Stock(named: "Boeing", code: "BA"),
            Stock(named: "CME", code:"CME"),
            Stock(named: "GM", code: "GM"),
            Stock(named: "Visa", code:"V"),
            Stock(named: "Walmart", code: "WMT"),
            Stock(named: "Nike", code: "NKE")]
    }
}
 
