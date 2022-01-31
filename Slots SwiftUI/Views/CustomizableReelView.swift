//
//  CustomizableReelView.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 1/31/22.
//

import SwiftUI

struct CustomizableReelView: View {
    let maxHeight : CGFloat
    let imageName : String
    
    var body: some View {
        ZStack {
            Image("gfx-reel")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: maxHeight)
            if imageName != "gfx-reel" {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: maxHeight)
                    .modifier(ShadowModifier())
            }
            
        }
    }
    
}

struct CustomizableReelView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizableReelView(maxHeight: 50, imageName: "gfx-seven")
    }
}
