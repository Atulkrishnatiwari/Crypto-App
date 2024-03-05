//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Celestial on 24/02/24.
//

import Foundation
import Combine
class CoinDataService
{
    @Published var allCoins: [CoinModel] = []
//    var cancellable = Set<AnyCancellable>()
    var coinSubscription: AnyCancellable?
    init(){
        getCoins()
    }
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {return}
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion{
                case.finished:
                    break
                case.failure(let error):
                    print("error while Reciving Coins Data \(error.localizedDescription)")
                }
            } receiveValue: {[weak self] (returnedCoins) in
                
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            }
//            .store(in: &cancellable)

    }
}
