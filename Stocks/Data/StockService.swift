//
//  BirdService.swift
//  Stocks
//
//  Created by Shixian Fang on 7/5/20.
//  Copyright © 2020 Shixian Fang. All rights reserved.
//

import Foundation

enum StockCallingError: Error {
    case problemGeneratingimgURL
    case problemGeneratingDataFromAPI
    case problemDecodingData
}

//test empty API "https://run.mocky.io/v3/03f31e51-739f-4a41-8751-7b6e58e4600f"
class StockService {
    private let urlString = "https://run.mocky.io/v3/1b0fc466-6dfa-4438-8c52-0f890c3a5599"
    func getStocks(completion: @escaping ([Stock]?, Error?) -> ())  {
        guard let url = URL(string: self.urlString) else {
            DispatchQueue.main.async { completion(nil,
            StockCallingError.problemGeneratingimgURL)}
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data,
            response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, StockCallingError.problemGeneratingDataFromAPI)}
                return
            }
            do {
                let stockResult = try JSONDecoder().decode(StockResult.self,
                                                          from: data)
                DispatchQueue.main.async {completion(stockResult.stocks, nil)}
            } catch (let error) {
                //print(error)
                DispatchQueue.main.async {completion(nil, StockCallingError.problemDecodingData)}
            }
            
        }
        task.resume()
        
    }
}
 

