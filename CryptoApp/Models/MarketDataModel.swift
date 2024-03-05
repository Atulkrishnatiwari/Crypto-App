//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Celestial on 27/02/24.
//

import Foundation

//JSON Data:
/*
 URL : https://api.coingecko.com/api/v3/global
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 12895,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 941,
     "total_market_cap": {
       "btc": 39689323.653011896,
       "eth": 690293609.1563674,
       "ltc": 29718820884.369045,
       "bch": 7478869396.387579,
       "bnb": 5633326750.522463,
       "eos": 2723165401078.107,
       "xrp": 3993004454491.5303,
       "sats": 3968932365301189.5
     },
     "total_volume": {
       "btc": 2383379.83978454,
       "eth": 41452756.56443552,
       "xag": 5951002732.055495,
       "xau": 66246478.3152371,
       "bits": 2383379839784.5396,
       "sats": 238337983978453.97
     },
     "market_cap_percentage": {
       "btc": 49.481835900495774,
       "eth": 17.36901033238191,
       "usdt": 4.361223541790413,
       "bnb": 2.730125324961364,
       "sol": 2.1931510109687413,
       "steth": 1.417658054617511,
       "xrp": 1.3680888495381736,
       "usdc": 1.268684537609624,
       "ada": 0.9752659362893025,
       "avax": 0.6624154861106727
     },
     "market_cap_change_percentage_24h_usd": 7.4635722321054585,
     "updated_at": 1709028040
   }
 }

 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    var marketCap: String{
        if let item = totalMarketCap.first(where: { $0.key == "inr" })
        {
            return "₹" + item.value.formattedWithAbbrevations()
        }
        return ""
    }
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "inr" })
        {
            return "₹" + item.value.formattedWithAbbrevations()
        }
        return ""
    }
    
    var btcDominance: String
    {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" })
        {
            return item.value.asPercetString()
        }
        return ""
    }
}
