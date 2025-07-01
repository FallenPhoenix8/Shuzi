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
    var audioPlayer: AVAudioPlayer?
    
    // Play sounds and digits
    private func playSound(name: String, ext: String = "aiff") {
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext) else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func playDigit(digit: Int) {
        // TODO: Play digit
    }
    
    private func digitToName(digit: Int) -> String? {
        return nil // TODO: digitToName
    }
    
    func playRandomSuccessSound() {
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "whoop")
    }
    
    func playRandomIncorrectSound() {
        playSound(name: ["OhNo", "incorrectAnswer"].randomElement() ?? "incorrectAnswer")
    }
    
    func playNumber(num: Int) {
        // TODO: playNumber
    }
}
