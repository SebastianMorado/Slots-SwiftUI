//
//  InfoView.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 1/29/22.
//

import SwiftUI

struct InfoView: View {
    //MARK: - Properties
    let infoList : [[String]] = [
        ["Application", "Slot Machine"],
        ["Platforms", "iPhone, iPad, Mac"],
        ["Developer", "Sebastian Morado"],
        ["Designer", "Robert Petras"],
        ["Music", "Dan Lebowitz"],
        ["Copyright", "©2020 ALl rights reserved."],
        ["Version", "1.0.0"]
    ]
    
    let scoringList : [String] = [
        "10x"
    ]
    
    @Environment(\.presentationMode) var presentationeMode
    
    //MARK: - Body
    var body: some View {
        VStack {
            LogoView()
                .padding(.top, 30)
                .padding(.bottom, 10)
            Form {
                Section {
                    ScoringSectionView()
                } header: {
                    HStack {
                        Spacer()
                        Text("Scoring")
                            .font(.title3)
                            .fontWeight(.bold)
                        .foregroundColor(colorPink)
                        Spacer()
                    }
                }

                Section {
                    ForEach(infoList, id: \.self) { item in
                        HStack {
                            Text(item[0])
                                .foregroundColor(.gray)
                            Spacer()
                            Text(item[1])
                        }
                    }
                    
                } header: {
                    Text("About the application")
                }

            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                audioPlayer?.stop()
                presentationeMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "x.circle")
                    .padding()
                    .font(Font.title.weight(.medium))
                    .foregroundColor(.gray)
            }

        }
        .onAppear {
            //playSound(sound: "background-music", type: "mp3")
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .preferredColorScheme(.light)
    }
}
