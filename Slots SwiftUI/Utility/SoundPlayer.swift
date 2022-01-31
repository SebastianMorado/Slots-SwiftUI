//
//  SoundPlayer.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 2/1/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: could not find and play sound file")
        }
    }
}
