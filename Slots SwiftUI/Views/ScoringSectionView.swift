//
//  ScoringSectionView.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 1/31/22.
//

import SwiftUI

struct ScoringSectionView: View {
    let maxHeight : CGFloat = 45
    
    var body: some View {
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-seven")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-seven")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-seven")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("50x")
                .foregroundColor(colorYellow)
                .font(.system(.title, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-seven")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-seven")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-reel")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("2x")
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-seven")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-reel")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-reel")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("1x")
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-coin")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-coin")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-coin")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("10x")
                .foregroundColor(colorYellow)
                .font(.system(.title, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-coin")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-coin")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-reel")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("1x")
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-coin")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-reel")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-reel")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("0.5x")
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-bell")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-bell")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-bell")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("5x")
                .foregroundColor(colorYellow)
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-grape")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-grape")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-grape")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("4x")
                .foregroundColor(colorYellow)
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-strawberry")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-strawberry")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-strawberry")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("3x")
                .foregroundColor(colorYellow)
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
        HStack {
            HStack {
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-cherry")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-cherry")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
                CustomizableReelView(maxHeight: maxHeight, imageName: "gfx-cherry")
                    .padding(.vertical, 10)
                    .padding(.horizontal, -5)
            }
            Spacer()
            Text("2x")
                .foregroundColor(colorYellow)
                .font(.system(.title2, design: .serif))
                .fontWeight(.heavy)
        }
    }
}

struct ScoringSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            Section {
                ScoringSectionView()
                    .preferredColorScheme(.light)
            } header: {
                Text("SCORING")
            }
            
        }
            
        
            
        
    }
}
