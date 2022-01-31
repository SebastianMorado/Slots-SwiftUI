//
//  ResetView.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 2/1/22.
//

import SwiftUI

struct ResetView: View {
    //MARK: - Property
    @ObservedObject var slotsManager : SlotsLogicManager
    @Binding var isShowingResetView : Bool
    @State private var isAnimating : Bool = false
    
    //MARK: - Body
    var body: some View {
        ZStack {
            colorBlack.edgesIgnoringSafeArea(.all)
            
            //Modal
            VStack(alignment: .center, spacing: 0) {
                //TITLE
                Text("RESET DATA")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(colorPink)
                    .foregroundColor(.white)
                
                Spacer()
                //Message
                VStack(alignment: .center, spacing: 16) {
                    Image("gfx-spin")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 72)
                    Text("Are you sure you want to reset? The current highscore will be cleared.")
                        .font(.system(.body, design: .rounded))
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .layoutPriority(1)
                    HStack {
                        Button {
                            slotsManager.reset(eraseHighscore: true)
                            isShowingResetView = false
                        } label: {
                            Text("I'm sure".uppercased())
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.semibold)
                                .tint(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .frame(minWidth: 128)
                        }
                        .background(
                            Capsule()
                                .foregroundColor(colorPink)
                        )
                        Button {
                            isShowingResetView = false
                        } label: {
                            Text("Cancel".uppercased())
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.semibold)
                                .tint(colorPink)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .frame(minWidth: 128)
                        }
                        .background(
                            Capsule()
                                .strokeBorder(lineWidth: 1.75)
                                .foregroundColor(colorPink)
                        )
                    }

                }
                Spacer()
                    
            }
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: colorBlack, radius: 6, x: 0, y: 8)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -100)
            .animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: isAnimating)
            .onAppear {
                isAnimating.toggle()
            }
            .onDisappear {
                isAnimating.toggle()
            }
        }
    }
}

struct ResetView_Previews: PreviewProvider {
    static var previews: some View {
        ResetView(slotsManager: SlotsLogicManager(), isShowingResetView: .constant(true))
    }
}
