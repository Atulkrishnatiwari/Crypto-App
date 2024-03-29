//
//  HomeView.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import SwiftUI

struct HomeView: View 
{
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false//animate right
    @State private var showPortfolioView: Bool = false //new sheet
    var body: some View {
        ZStack
        {
            //Background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            //content layer
            VStack{
                
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                if(!showPortfolio)
                {
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                if(showPortfolio)
                {
                    portFolioCoinList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider
{
    
    static var previews: some View
    {
        NavigationStack{
            HomeView()
                .navigationBarBackButtonHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}
extension HomeView
{
    private var homeHeader: some View
    {
        HStack
        {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if(showPortfolio)
                    {
                        showPortfolioView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring)
                    {
                        
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    private var allCoinsList: some View{
        List
        {
            ForEach(vm.allCoins){coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var portFolioCoinList: some View{
        List
        {
            ForEach(vm.portfolioCoins){coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var columnTitles: some View
    {
        HStack
        {
            Text("Coin")
            Spacer()
            if(showPortfolio)
            {
                Text("Holdings")
            }
            Text("Price")
                .frame(width:UIScreen.main.bounds.width/3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
