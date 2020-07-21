//
//  StockTest.swift
//  StocksTests
//
//  Created by Shixian Fang on 7/16/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import XCTest
@testable import Stocks

class StockTest: XCTestCase {


    func testStockDebugDescription() throws {

        let subjectUnderTest = Stock(
            named: "My stock",
            code: "MY",
            imageUrl: "https://img.cdndtl.co.uk/umbraco2017/21948/peach-emoji-iphone.jpg?auto=format&s=02ef7650f71bfeb231438eacd3e95756",
            price:"666",
            industry: "IT")

        let actualValue = subjectUnderTest.debugDescription

        let expectedValue = "Stock(name:My stock, code:MY)"
        XCTAssertEqual(actualValue, expectedValue)
    }


}
