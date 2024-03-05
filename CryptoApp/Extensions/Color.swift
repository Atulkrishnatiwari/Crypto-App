//
//  Color.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import Foundation
import SwiftUI

extension Color
{
    static let theme = ColorTheme()
}

struct ColorTheme
{
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("MyGreenColor")
    let red = Color("MyRedColor")
    let secondaryText = Color("SecondaryTextColor")
}
