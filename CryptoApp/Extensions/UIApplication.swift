//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Celestial on 26/02/24.
//

import Foundation
import SwiftUI
extension UIApplication
{
    func  endEditing()
    {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
