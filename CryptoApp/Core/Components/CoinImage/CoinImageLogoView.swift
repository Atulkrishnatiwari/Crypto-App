//
//  CoinImageLogoView.swift
//  CryptoApp
//
//  Created by Celestial on 03/03/24.
//

import SwiftUI

struct CoinImageLogoView: View 
{
    let coin: CoinModel
    var body: some View {
        VStack{
            CoinImageView(coin: coin)
                .frame(width: 50,height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinImageLogoView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group{
            CoinImageLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
            
            CoinImageLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
