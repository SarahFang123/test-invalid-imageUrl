//
//  StockServiceTests.swift
//  StocksTests
//
//  Created by Shixian Fang on 7/17/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import XCTest
@testable import Stocks

class StockServiceTests: XCTestCase {
    var systemUnderTest: StockService!

    override func setUpWithError() throws {
        self.systemUnderTest = StockService()
    }

    override func tearDownWithError() throws {
        self.systemUnderTest = nil
    }

    func testAPI_returnsSuccessfulResult() throws {
        //Given
        var stocks:[Stock]!
        var error: Error?
        
        let promise = expectation(description:"Completion handler is invoked")
        self.systemUnderTest.getStocks(completion: { data, shouldntHappen  in
            stocks = data
            error = shouldntHappen
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
        //when
        XCTAssertNotNil(stocks)
        XCTAssertNil(error)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
