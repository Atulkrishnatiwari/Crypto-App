//
//  Double.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import Foundation
extension Double
{
    // Converts a double into a currency with 2 decimal places
    // ....
    //Convert 1234.56 to ₹1234.56
    //
    //
    //...
    
    
    private var currencyFormater2: NumberFormatter{
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current//default value
        formatter.currencyCode = "inr"//change currency
        formatter.currencySymbol = "₹"//change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    // Converts a double into a currency as a with 2-6 decimal places
    // ....
    //Convert 1234.56 to "₹1234.56"
    //Convert 12.34556 to "₹12.56"
    //Convert 0.12562 to "₹0.12342"
    //...
    
    func asCurrencyWith2Decimal() -> String{
        let number = NSNumber(value: self)
        return currencyFormater2.string(from: number) ?? "₹0.00"
    }
    
    
    
    // Converts a double into a currency with 2-6 decimal places
    // ....
    //Convert 1234.56 to ₹1234.56
    //Convert 12.34556 to ₹12.56
    //Convert 0.12562 to ₹0.12342
    //...
    
    
    private var currencyFormater6: NumberFormatter{
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current//default value
        formatter.currencyCode = "inr"//change currency
        formatter.currencySymbol = "₹"//change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    // Converts a double into a currency as a with 2-6 decimal places
    // ....
    //Convert 1234.56 to "₹1234.56"
    //Convert 12.34556 to "₹12.56"
    //Convert 0.12562 to "₹0.12342"
    //...
    
    func asCurrencyWith6Decimal() -> String{
        let number = NSNumber(value: self)
        return currencyFormater6.string(from: number) ?? "₹0.00"
    }
    
    // Converts a double into String representation
    // ....
    //Convert 1.2345 to "₹1.23"
    //
    //
    //...
    func asNumberString() -> String{
        return String(format: "%.2f", self)
    }
    // Converts a double into String representation with symbol
    // ....
    //Convert 1.2345 to "₹1.23%"
    //
    //
    //...
    func asPercetString() -> String{
        return asNumberString() + "%"
    }
    ///Convert a Double to a string With K,M,Bn,Tr Abbrevations
    ///'''''
    ///Convert 12 to 12.00
    ///Convert 1234 to 1.23K
    ///Convert 123456 to 123.45K
    ///Convert 12345678 to 12.34M
    ///Convert 1234567890 to 1.23Bn
    ///Convert 123456789012 to 123.45Bn
    ///Convert 12345678901234 to 12.34Tr
    ///''''''
    func formattedWithAbbrevations() -> String
    {
        let num = abs(Double(self))
        let sign = (self < 0) ? "_" : ""
        
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
            
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
            
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()
        default:
            return "\(sign)\(self)"
        }
    }
}
