//
//  Coin.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 1/3/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import UIKit

struct Coin: Codable {
    var id: String
    var name: String
    var symbol: String
    var rank: String
    var priceUSD: String
    var priceBTC: String
    var volumeUSD_24h: String
    var marketCapUSD: String
    var availableSupply: String
    var totalSupply: String
    var percentChange_1h: String
    var percentChange_24h: String
    var percentChange_7d: String
    var lastUpdated: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        case priceUSD = "price_usd"
        case priceBTC = "price_btc"
        case volumeUSD_24h = "24h_volume_usd"
        case marketCapUSD = "market_cap_usd"
        case availableSupply = "available_supply"
        case totalSupply = "total_supply"
        case percentChange_1h = "percent_change_1h"
        case percentChange_24h = "percent_change_24h"
        case percentChange_7d = "percent_change_7d"
        case lastUpdated = "last_updated"
    }
//    init(id: String, name: String, symbol: String, rank: Double, priceUSD: Double, priceBTC: Double, volumeUSD_24h: Double, marketCapUSD: Double, availableSupply: Double, totalSupply: Double, percentChange_1h: Double, percentChange_24h: Double, percentChange_7d: Double, lastUpdated: Double) {
//        self.id = id
//        self.name = name
//        self.symbol = symbol
//        self.rank = rank
//        self.priceUSD = priceUSD
//        self.priceBTC = priceBTC
//        self.volumeUSD_24h = volumeUSD_24h
//        self.marketCapUSD = marketCapUSD
//        self.availableSupply = availableSupply
//        self.totalSupply = totalSupply
//        self.percentChange_1h = percentChange_1h
//        self.percentChange_24h = percentChange_24h
//        self.percentChange_7d = percentChange_7d
//        self.lastUpdated = lastUpdated
//    }
//
//    init(json: [String: Any]) {
//        self.id = json["id"] as? String ?? ""
//        self.name = json["name"] as? String ?? ""
//        self.symbol = json["symbol"] as? String ?? ""
//        self.rank = json["rank"] as? Double ?? -1
//        self.priceUSD = json["price_usd"] as? Double ?? -1
//        self.priceBTC = json["price_btc"] as? Double ?? -1
//        self.volumeUSD_24h = json["24h_volume_usd"] as? Double ?? -1
//        self.marketCapUSD = json["market_cap_usd"] as? Double ?? -1
//        self.availableSupply = json["available_supply"] as? Double ?? -1
//        self.totalSupply = json["total_supply"] as? Double ?? -1
//        self.percentChange_1h = json["percent_change_1h"] as? Double ?? -1
//        self.percentChange_24h = json["percent_change_24h"] as? Double ?? -1
//        self.percentChange_7d = json["percent_change_7d"] as? Double ?? -1
//        self.lastUpdated = json["last_updated"] as? Double ?? -1
//    }
}
