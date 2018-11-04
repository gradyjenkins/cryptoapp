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
}
