//
//  PreviewProwider.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import Foundation
import SwiftUI
extension PreviewProvider{
    
    static var dev: DeveloperPreview{
        return DeveloperPreview.instace
    }
}
class DeveloperPreview{
    
    static let instace = DeveloperPreview()
    private init()
    {}
    let homeVM = HomeViewModel()
    
    let state1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let state2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 4219401,
        marketCap: 83057694590653,
        marketCapRank: 1,
        fullyDilutedValuation: 88829980963647,
        totalVolume: 2080820158488,
        high24H: 4310184,
        low24H: 4217480,
        priceChange24H: -69942.73184135184,
        priceChangePercentage24H: -1.63062,
        marketCapChange24H: -1222155310476.75,
        marketCapChangePercentage24H: -1.45012,
        circulatingSupply: 19635393,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 5128383,
        athChangePercentage: -17.51931,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 3993.42,
        atlChangePercentage: 105822.39499,
        atlDate: "2013-07-05T00:00:00.000Z",
        lastUpdated: "2024-02-23T09:26:09.386Z",
        sparklineIn7D: SparklineIn7D(price: [
            52077.172766748845,
            51893.3153743087,
            51738.28354529973,
            51851.335864228124,
            51920.53031358234,
            52274.57178400924,
            52235.54311335937,
            52356.79782686047,
            52314.97483634101,
            51894.78294379994,
            51774.07007717442,
            52086.16847890425,
            52023.75736709356,
            51981.15365684245
        ]),
        priceChangePercentage24HInCurrency: -1.6306161882543226,
        currentHoldings: 1.5
    )
}
