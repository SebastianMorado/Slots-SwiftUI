//
//  ContentView.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Property
    @ObservedObject var slotsManager : SlotsLogicManager
    @State private var isPresentingInfo : Bool = false
    @State private var isShowingResetView : Bool = false
    @State private var animatingSymbol : Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - Body
    var body: some View {
        ZStack {
            //MARK: - Background
            LinearGradient(colors: [colorPink, colorPurple], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            //MARK: - Interface
            VStack(alignment: .center, spacing: 5) {
                //MARK: - Header
                LogoView()
                //MARK: - Score
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle(size: 10)
                            .multilineTextAlignment(.trailing)
                        Text(String(slotsManager.currentCoins))
                            .scoreNumberStyle()
                            .shadow(color: colorBlack, radius: 0, x: 0, y: 3)
                            .layoutPriority(1)
                    }
                    .modifier(MiniCapsuleModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text(String(slotsManager.highScore))
                            .scoreNumberStyle()
                            .shadow(color: colorBlack, radius: 0, x: 0, y: 3)
                            .layoutPriority(1)
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle(size: 10)
                            .multilineTextAlignment(.leading)
                        
                    }
                    .modifier(MiniCapsuleModifier())
                }
                Spacer()
                //MARK: - Slot Machine
                
                VStack(alignment: .center, spacing: 0) {
                    //MARK: - Reel 1
                    ZStack {
                        ReelView()
                        Image(slotsManager.currentReelImages[0])
                            .resizable()
                            .modifier(ReelImageModifier())
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(.easeOut(duration: Double.random(in: 0.5...0.7)), value: animatingSymbol)
                            .onAppear {
                                animatingSymbol.toggle()
                                playSound(sound: "riseup", type: "mp3")
                            }
                            
                    }
                    //MARK: - Reel 2 and 3
                    
                    HStack(alignment: .center, spacing: 0) {
                        ZStack {
                            ReelView()
                            Image(slotsManager.currentReelImages[1])
                                .resizable()
                                .modifier(ReelImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.7...0.9)), value: animatingSymbol)
                                .onAppear {
                                    animatingSymbol.toggle()
                                }
                        }
                        Spacer()
                        ZStack {
                            ReelView()
                            Image(slotsManager.currentReelImages[2])
                                .resizable()
                                .modifier(ReelImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.9...1.1)), value: animatingSymbol)
                                .onAppear {
                                    animatingSymbol.toggle()
                                }
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    //MARK: - Spin
                    Button {
                        animatingSymbol = false
                        slotsManager.spin()
                        withAnimation {
                            animatingSymbol = true
                        }
                        haptics.impactOccurred()
                        
                    } label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ReelImageModifier())
                    }

                } // Slot Machine
                .layoutPriority(2)
                
                //MARK: - Footer
                
                Spacer()
                HStack {
                    //Bets
                    HStack(alignment: .center, spacing: 5) {
                        ChipsImageView(numberOfCoins: slotsManager.currentBet)
                            .scaleEffect(0.9)
                            .padding(.trailing, -40)
                            .padding(.leading, -20)
                            .animation(.spring(), value: slotsManager.currentBet)
                        HStack {
                            Text("Current\nBet".uppercased())
                                .scoreLabelStyle(size: 9)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .minimumScaleFactor(0.95)
                            Text(String(slotsManager.currentBet))
                                .scoreNumberStyle()
                                .shadow(color: colorBlack, radius: 0, x: 0, y: 3)
                                .layoutPriority(1)
                        }
                        .modifier(MiniCapsuleModifier())
                        
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .scaledToFit()
                            .frame(height: 50)
                            .modifier(ShadowModifier())
                        Button {
                            slotsManager.increaseBet(bet: 10)
                            haptics.impactOccurred()
                        } label: {
                            Text("+10")
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .font(.system(.title, design: .rounded))
                                .padding(.vertical, 5)
                                .frame(width: 90)
                                .shadow(color: colorBlack, radius: 0, x: 0, y: 3)
                        }
                        .modifier(BetCapsuleModifier())
                        
                    }
                    

                }
                
            }
            //BUTTONS
            .overlay(
                Button(action: {
                    isShowingResetView = true
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .modifier(ButtonModifier())
                })
                , alignment: .topLeading)
            .overlay(
                Button(action: {
                    isPresentingInfo.toggle()
                }, label: {
                    Image(systemName: "info.circle")
                        .modifier(ButtonModifier())
                })
                , alignment: .topTrailing)
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: slotsManager.isGameOver || isShowingResetView ? 5 : 0, opaque: false)
            
            if slotsManager.isGameOver {
                GameOverView(slotsManager: slotsManager)
            }
            
            if isShowingResetView {
                ResetView(slotsManager: slotsManager, isShowingResetView: $isShowingResetView)
            }
        }
        .sheet(isPresented: $isPresentingInfo, content: {
            InfoView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(slotsManager: SlotsLogicManager())
    }
}
