//
//  StockListViewControllerTests.swift
//  StocksTests
//
//  Created by Shixian Fang on 7/17/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import XCTest
@testable import Stocks

class StockListViewControllerTests: XCTestCase {
    var systemUnderTest: StockListViewController!

    override func setUpWithError() throws {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        self.systemUnderTest = navigationController.topViewController as?
        StockListViewController
        
        UIApplication.shared.windows
            .filter { $0.isKeyWindow}
            .first!
            .rootViewController = self.systemUnderTest
        
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(self.systemUnderTest.view)
    }


    func testTableView_loadsStocks() {
        //Given
        let mockStockService = MockStockService()
        let mockStocks = [
            Stock(named: "Peach", code: "PCH", imageUrl: "https://img.cdndtl.co.uk/umbraco2017/21948/peach-emoji-iphone.jpg?auto=format&s=02ef7650f71bfeb231438eacd3e95756", price: "123", industry: "IT"),
            Stock(named: "Banana", code: "BNN", imageUrl: "https://img.cdndtl.co.uk/umbraco2017/21948/peach-emoji-iphone.jpg?auto=format&s=02ef7650f71bfeb231438eacd3e95756", price: "456", industry: "IT"),
            Stock(named: "Orange", code: "ORG", imageUrl: "https://img.cdndtl.co.uk/umbraco2017/21948/peach-emoji-iphone.jpg?auto=format&s=02ef7650f71bfeb231438eacd3e95756", price: "789", industry: "IT"),
        ]
        mockStockService.mockStocks = mockStocks
        
        self.systemUnderTest.viewDidLoad()
        self.systemUnderTest.stockService = mockStockService
        
        XCTAssertEqual(0, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
        //When
        self.systemUnderTest.viewWillAppear(false)
        
        //Then
        XCTAssertEqual(mockStocks.count, self.systemUnderTest.stock.count)
        XCTAssertEqual(mockStocks.count, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
    }

    class MockStockService: StockService {
        var mockStocks: [Stock]!
        var mockError: Error?
        
        override func getStocks(completion: @escaping ([Stock]?, Error?) -> ()) {
            completion(mockStocks, mockError)
        }
    }

}
