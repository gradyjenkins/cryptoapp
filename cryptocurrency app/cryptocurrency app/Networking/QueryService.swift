//
//  QueryService.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 1/4/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import Foundation
class QueryService {
    typealias QueryResult = ([Coin]?, String) -> ()
    typealias JSONDictionary = [String: Any]
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var coins: [Coin] = []
    var errorMessage = ""
    
    func getResults(_ url: String, completion: @escaping QueryResult){
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                self.coins = coins
                DispatchQueue.main.async {
                    completion(self.coins, self.errorMessage)
                }
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
        }.resume()
    }
}
