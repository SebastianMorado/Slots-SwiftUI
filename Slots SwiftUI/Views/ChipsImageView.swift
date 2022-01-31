//
//  ChipsImageView.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 2/1/22.
//

import SwiftUI

struct ChipsImageView: View {
    let numberOfCoins : Int
    let chipsHeight : CGFloat = 50
    var body: some View {
        ZStack {
            if numberOfCoins > 10 {
                Image("gfx-casino-chips")
                    .resizable()
                    .opacity(1)
                    .scaledToFit()
                    .frame(height: chipsHeight)
                    .modifier(ShadowModifier())
                    .offset(x: 35, y: -15)
                    .scaleEffect(0.95)
            }
            if numberOfCoins > 20 {
                Image("gfx-casino-chips")
                    .resizable()
                    .opacity(1)
                    .scaledToFit()
                    .frame(height: chipsHeight)
                    .modifier(ShadowModifier())
                    .offset(x: -40, y: -15)
                    .scaleEffect(0.90)
            }
            Image("gfx-casino-chips")
                .resizable()
                .opacity(1)
                .scaledToFit()
                .frame(height: chipsHeight)
                .modifier(ShadowModifier())
            if numberOfCoins > 30 {
                Image("gfx-casino-chips")
                    .resizable()
                    .opacity(1)
                    .scaledToFit()
                    .frame(height: chipsHeight)
                    .modifier(ShadowModifier())
                    .offset(x: 40, y: 20)
                    .scaleEffect(1.05)
            }
            if numberOfCoins > 40 {
                Image("gfx-casino-chips")
                    .resizable()
                    .opacity(1)
                    .scaledToFit()
                    .frame(height: chipsHeight)
                    .modifier(ShadowModifier())
                    .offset(x: -20, y: 25)
                    .scaleEffect(1.07)
            }
            
        }
        .frame(maxWidth: 150, maxHeight: 120)
        
    }
}

struct ChipsImageView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsImageView(numberOfCoins: 50)
            .previewLayout(.sizeThatFits)
    }
}
