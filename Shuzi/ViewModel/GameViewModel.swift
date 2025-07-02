//
//  GameViewModel.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 30/06/2025.
//

import AVFoundation
import Foundation
import Observation

@Observable
class GameViewModel {
    var gameModel: GameModel = .defaultGameModel
    private var audioPlayer: AVAudioPlayer?
    
    private func queuePlaySound(soundURL: URL) throws {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        
        repeat {
            ()
        } while audioPlayer?.isPlaying ?? false
    }
    
    // Play sounds and digits
    private func playSound(name: String, ext: String = "aiff") {
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext) else {
            return
        }
        
        do {
            try queuePlaySound(soundURL: soundURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func playDigit(digit: Int) {
        playSound(name: digitToName(digit: digit) ?? "bell")
    }
    
    private func digitToName(digit: Int) -> String? {
        let numNames = [
            "zero",
            "one",
            "two",
            "three",
            "four",
            "five",
            "six",
            "seven",
            "eight",
            "nine",
            "ten"
        ]
        
        if digit >= 0, digit <= 10 {
            return numNames[digit]
        }
        
        return nil
    }
    
    func playRandomSuccessSound() {
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "whoop")
    }
    
    func playRandomIncorrectSound() {
        playSound(name: ["OhNo", "incorrectAnswer"].randomElement() ?? "incorrectAnswer")
    }
    
    /// Receives a number between 0 and 99 (inclusive)
    /// and plays the sound.
    ///
    /// If the number is outside that range, then play the "bell" sound.
    func playNumber(num: Int) {
        let tensDigit: Int = num / 10
        let unitsDigit: Int = num % 10
        print("Playing number: \(num)")
        
        switch num {
        case 0...10:
            playDigit(digit: unitsDigit)
        case 11...19:
            playDigit(digit: 10)
            playDigit(digit: unitsDigit)
        case 20...99:
            playDigit(digit: tensDigit)
            playDigit(digit: 10)
            if unitsDigit != 0 {
                playDigit(digit: unitsDigit)
            }
        default:
            print("Invalid number: \(num)")
            playSound(name: "bell")
        }
    }
}
