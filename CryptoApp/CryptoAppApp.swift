//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import SwiftUI

@main
struct CryptoAppApp: App 
{
    @StateObject private var vm = HomeViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    var body: some Scene
    {
        WindowGroup {
            NavigationStack{
                HomeView()
                    .navigationBarBackButtonHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
