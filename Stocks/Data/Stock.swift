//
//  Stock.swift
//  Stocks
//
//  Created by Shixian Fang on 7/4/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import Foundation

class Stock: CustomDebugStringConvertible, Codable {
    
    var debugDescription: String {
        return "Stock(name:\(self.name), code:\(self.code))"
    }
    
    var name: String
    var code: String
    var imageUrl: String
    //var favorite: Bool = false
    var price: String
    var industry: String
    
    private enum Codingkeys: String, CodingKey {
        case name, code, imageUrl, price, industry
    }
    
    init(named name: String, code: String, imageUrl: String, price: String, industry: String) {
        self.name = name
        self.code = code
        self.imageUrl = imageUrl
        self.price = price
        self.industry = industry
    }
}

struct StockResult: Codable {
    let stocks: [Stock]
}
