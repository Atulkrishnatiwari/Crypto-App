//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import Foundation
//CoinGecko Api info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 Json Rsponse
 
 [
   {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 4219401,
     "market_cap": 83057694590653,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 88829980963647,
     "total_volume": 2080820158488,
     "high_24h": 4310184,
     "low_24h": 4217480,
     "price_change_24h": -69942.73184135184,
     "price_change_percentage_24h": -1.63062,
     "market_cap_change_24h": -1222155310476.75,
     "market_cap_change_percentage_24h": -1.45012,
     "circulating_supply": 19635393,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 5128383,
     "ath_change_percentage": -17.51931,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 3993.42,
     "atl_change_percentage": 105822.39499,
     "atl_date": "2013-07-05T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-02-23T09:26:09.386Z",
     "sparkline_in_7d": {
       "price": [
         52088.173697885664,
         52184.34098661096,
         51095.29306783685,
         51067.967072300395,
         51201.271638117025
       ]
     },
     "price_change_percentage_24h_in_currency": -1.6306161882543226
   },
 */
struct CoinModel: Identifiable, Codable
{
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Int?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey{
        case id, symbol, name, image
                case currentPrice = "current_price"
                case marketCap = "market_cap"
                case marketCapRank = "market_cap_rank"
                case fullyDilutedValuation = "fully_diluted_valuation"
                case totalVolume = "total_volume"
                case high24H = "high_24h"
                case low24H = "low_24h"
                case priceChange24H = "price_change_24h"
                case priceChangePercentage24H = "price_change_percentage_24h"
                case marketCapChange24H = "market_cap_change_24h"
                case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
                case circulatingSupply = "circulating_supply"
                case totalSupply = "total_supply"
                case maxSupply = "max_supply"
                case ath = "ath"
                case athChangePercentage = "ath_change_percentage"
                case athDate = "ath_date"
                case atl = "atl"
                case atlChangePercentage = "atl_change_percentage"
                case atlDate = "atl_date"
                case lastUpdated = "last_updated"
                case sparklineIn7D = "sparkline_in_7d"
                case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
                case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel
    {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    var currentHoldingsValue: Double{
        return (currentHoldings ?? 0) * currentPrice
    }
    var rank: Int{
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
