//
//  SlotsLogicManager.swift
//  Slots SwiftUI
//
//  Created by Sebastian Morado on 1/31/22.
//

import Foundation

class SlotsLogicManager: ObservableObject {
    @Published var currentCoins : Int = 100
    @Published var currentBet : Int = 10
    @Published var highScore : Int
    
    @Published var currentReelImages : [String]
    @Published var isGameOver : Bool = false
    
    let allReelImages : [String] = [
        "gfx-cherry",
        "gfx-strawberry",
        "gfx-grape",
        "gfx-bell",
        "gfx-coin",
        "gfx-seven"
    ]
    
    init() {
        //Initialize high score
        highScore = UserDefaults.standard.integer(forKey: "highScore")
        
        //Set random items on board
        var temporaryArray : [String] = []
        for _ in 0...2 {
            temporaryArray.append(allReelImages[Int.random(in: 0...5)])
        }
        currentReelImages = temporaryArray
        
    }
    
    func spin() {
        playSound(sound: "spin", type: "mp3")
        currentReelImages[0] = allReelImages[Int.random(in: 0...5)]
        currentReelImages[1] = allReelImages[Int.random(in: 0...5)]
        currentReelImages[2] = allReelImages[Int.random(in: 0...5)]
        
        calculateWinnings()
    }
    
    private func calculateWinnings() {
        var winnings : Int = 0
        let numberOfCherries = currentReelImages.filter({$0 == allReelImages[0]}).count
        let numberOfStrawberries = currentReelImages.filter({$0 == allReelImages[1]}).count
        let numberOfGrapes = currentReelImages.filter({$0 == allReelImages[2]}).count
        let numberOfBells = currentReelImages.filter({$0 == allReelImages[3]}).count
        let numberOfCoins = currentReelImages.filter({$0 == allReelImages[4]}).count
        let numberOfSevens = currentReelImages.filter({$0 == allReelImages[5]}).count
        
        if numberOfCherries == 3 {
            winnings = currentBet * 2
        } else if  numberOfStrawberries == 3 {
            winnings = currentBet * 3
        } else if numberOfGrapes == 3 {
            winnings = currentBet * 4
        } else if numberOfBells == 3 {
            winnings = currentBet * 5
        } else if numberOfCoins == 3 {
            winnings = currentBet * 10
        } else if numberOfSevens == 3 {
            winnings = currentBet * 50
        } else {
            if numberOfSevens == 1 {
                winnings += currentBet
            } else if numberOfSevens == 2 {
                winnings += currentBet * 2
            }
            
            if numberOfCoins == 1 {
                winnings += Int(currentBet / 2)
            } else if numberOfCoins == 2 {
                winnings += currentBet
            }
        }
        
        winnings -= currentBet
        currentCoins += winnings
        
        if winnings > 0 {
            playSound(sound: "win", type: "mp3")
        }
        //Check if new high score
        if currentCoins > highScore {
            playSound(sound: "high-score", type: "mp3")
            highScore = currentCoins
            UserDefaults.standard.set(highScore, forKey: "highScore")
        }
        //Check if game over
        if currentCoins <= 0 {
            isGameOver = true
            playSound(sound: "game-over", type: "mp3")
        }
    }
    
    func increaseBet(bet : Int) {
        playSound(sound: "casino-chips", type: "mp3")
        currentBet += bet
        if currentBet > 50 {
            currentBet = 10
        }
    }
    
    func reset(eraseHighscore : Bool) {
        playSound(sound: "chimeup", type: "mp3")
        currentBet = 10
        currentCoins = 100
        isGameOver = false
        if eraseHighscore {
            highScore = 0
            UserDefaults.standard.set(0, forKey: "highScore")
        }
    }
    
}
