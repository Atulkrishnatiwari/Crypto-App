//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Celestial on 23/02/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none, value: animate)
    }
}
struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View
    {
        CircleButtonAnimationView(animate: .constant(false))
            .foregroundStyle(.red)
            .frame(width: 100,height: 100)
    }
}
