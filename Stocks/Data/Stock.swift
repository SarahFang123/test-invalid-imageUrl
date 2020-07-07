//
//  Stock.swift
//  Stocks
//
//  Created by Shixian Fang on 7/4/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import Foundation

class Stock {
    var name: String
    var code: String
    //var confirmedSighting: Bool = false
    var favorite: Bool = false
    
    init(named name: String, code: String) {
        self.name = name
        self.code = code
    }
}
