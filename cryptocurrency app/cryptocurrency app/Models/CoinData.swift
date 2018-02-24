//
//  CoinData.swift
//  cryptocurrency app
//
//  Created by Grady Jenkins on 2/8/18.
//  Copyright © 2018 Grady Jenkins. All rights reserved.
//

import UIKit
struct RawResponse: Decodable {
    var response: String
    var type: Int
    var aggregated: Bool
    var data: [CoinData]
    var timeTo: Double
    var timeFrom: Double
    var firstValueInArray: Bool
    var conversionType: [String:String]
    
    
    private enum CodingKeys: String, CodingKey {
        case response = "Response"
        case type = "Type"
        case aggregated = "Aggregated"
        case data = "Data"
        case timeTo = "TimeTo"
        case timeFrom = "TimeFrom"
        case firstValueInArray = "FirstValueInArray"
        case conversionType = "ConversionType"
    }
}

struct CoinData: Codable {
    var time: Double
    var close: Double
    var high: Double
    var low: Double
    var open: Double
    var volumefrom: Double
    var volumeto: Double
    
    private enum CodingKeys: String, CodingKey {
        case time = "time"
        case close = "close"
        case high = "high"
        case low = "low"
        case open = "open"
        case volumefrom = "volumefrom"
        case volumeto = "volumeto"
    }
}
