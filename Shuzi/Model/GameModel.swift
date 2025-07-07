//
//  GameModel.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 28/06/2025.
//

import Foundation

struct GameModel {
    var score: Int
    let maxTurns: Int
    var volume: Float
    
    /// Turns played so far
    var turns: Int
    
    var answer: Int
    
    /// Possible solutions including answer
    var alternatives: [Int]
    
    var gameWon: Bool {
        turns >= maxTurns
    }
    
    var gameOver: Bool {
        score < 0 || gameWon
    }
    
    /// Increases game's score
    mutating func increaseScore(by: Int = 1) {
        score += by
    }
    
    // Update turns
    mutating func nextTurn() {
        turns += 1
    }
    
    /// Resets game score and turns
    mutating func reset() {
        score = 0
        turns = 0
    }
    
    mutating func generateNewProblem() {
        // Create an array of 4 different
        // random values between 0 and 99
        do {
            alternatives = try Int.generateUniqueRandomIntegers(count: 4, min: 0, max: 99)
        } catch {
            print(error)
            alternatives = []
        }
        
        // Let the last alternative be the answer
        answer = alternatives.last!
        
        // Shuffle the alternatives, so that the solution appears in a different position
        alternatives = alternatives.shuffled()
    }
    
    static var defaultGameModel: GameModel {
        var initialAlternatives: [Int] = []
        do {
            initialAlternatives = try Int.generateUniqueRandomIntegers(count: 4, min: 0, max: 99)
        } catch {
            print("Error generating initial alternatives: \(error)")
        }
        
        guard let answer = initialAlternatives.last else {
            fatalError("Failed to generate initial alternatives")
        }
        
        return GameModel(
            score: 0,
            maxTurns: 5,
            volume: 0.7,
            turns: 0,
            answer: answer,
            alternatives: initialAlternatives.shuffled()
        )
    }
}
