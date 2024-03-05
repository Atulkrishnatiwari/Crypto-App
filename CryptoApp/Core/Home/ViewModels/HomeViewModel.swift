//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject
{
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private  let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellable = Set<AnyCancellable>()
    init()
    {
       addSubscriber()
    }
    
    func addSubscriber()
    {
//        updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)//it will not publish vallue if we are typing contineuosly then we stop typing it will publish value after .5 seconds
            .map(filterAllCoin)
            .sink { [weak self] (returnedCoins) in
                
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellable)
        //        coinDataService.$allCoins
        //            .sink { returnedCoin in
        //                self.allCoins = returnedCoin
        //            }
        //            .store(in: &cancellable)
        
//        Updates marketData
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                
                self?.statistics = returnedStats
            }
            .store(in: &cancellable)
//            Updates Portfolio
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map{(coinModels, portfolioEntities) -> [CoinModel] in
                coinModels
                    .compactMap { (coin) -> CoinModel? in
                        
                        guard let entity = portfolioEntities.first(where: { $0.coinId == coin.id})else{
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink {[weak self] (returnedCoins) in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellable)
    }
    func updatePortfolio(coin: CoinModel, amount: Double){
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    private func filterAllCoin(text: String,coins: [CoinModel]) -> [CoinModel]
    {
        guard !text.isEmpty else
        {
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel]
    {
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else{
            return stats
        }
        let markeCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        stats.append(contentsOf:[
            markeCap,
            volume,
            btcDominance,
            portfolio
        ]
        )
        return stats
    }
}
