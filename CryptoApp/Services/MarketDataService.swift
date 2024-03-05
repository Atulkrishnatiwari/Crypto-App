//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Celestial on 27/02/24.
//

import Foundation
import Foundation
import Combine
class MarketDataService
{
    @Published var marketData: MarketDataModel? = nil
    var markeDataSubscription: AnyCancellable?
    init(){
        getData()
    }
    private func getData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {return}
        
        markeDataSubscription = NetworkManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: {completion  in
                
                switch completion
                {
                case .finished:
                    break
                case .failure(let error):
                    print("Error while n MarketData\(error)")
                }
                
            }, receiveValue: {[weak self] (returnedData)  in
                
                self?.marketData = returnedData.data
                self?.markeDataSubscription?.cancel()
            })
    }
}

