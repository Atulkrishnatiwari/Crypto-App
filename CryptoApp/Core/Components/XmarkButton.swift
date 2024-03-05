//
//  XmarkButton.swift
//  CryptoApp
//
//  Created by Celestial on 03/03/24.
//

import SwiftUI

struct XmarkButton: View 
{
    @Environment(\.dismiss) private var dismiss
    var body: some View
    {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XmarkButton_Previews: PreviewProvider{
    static var previews: some View
    {
        XmarkButton()
    }
}
