//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Celestial on 26/02/24.
//

import Foundation
import SwiftUI
struct StatisticView: View{
    let stat: StatisticModel
    
    var body: some View{
        VStack(alignment: .leading, spacing: 4)
        {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack{
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0: 180))
                Text(stat.percentageChange?.asPercetString() ?? "")
                    .font(.caption)
                    .bold()
            }.foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
                .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticView_Previews: PreviewProvider
{
    static var previews: some View
    {
        StatisticView(stat: dev.state1)
            .previewLayout(.sizeThatFits)
    }
}
