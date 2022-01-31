//
//  Extensions.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 1/29/22.
//

import SwiftUI

extension Text {
    func scoreLabelStyle(size : CGFloat) -> Text {
        self
            .foregroundColor(.white)
            .font(.system(size: size, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
            
    }
}
