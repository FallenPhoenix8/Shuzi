//
//  NumberOptionsView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 06/07/2025.
//

import SwiftUI

struct NumberOptionsView: View {
    let numbers: [Int]
    let answer: Int
    
    var body: some View {
        HStack {
            CircleView(value: numbers[0], answer: answer, color: .blue)
            CircleView(value: numbers[1], answer: answer, color: .green)
        }
        HStack {
            CircleView(value: numbers[2], answer: answer, color: .red)
            CircleView(value: numbers[3], answer: answer, color: .orange)
        }
        
        
    }
}

struct CircleView: View {
    let value: Int
    let answer: Int
    let color: Color
    
    @Environment(GameViewModel.self) var gVM
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color.gradient)
            
            Text("\(value)")
                .foregroundStyle(.white)
                .font(.title)
        }
        .onTapGesture {
            if answer == value {
                gVM.gameModel.increaseScore()
                gVM.playNumber(num: value)
            } else {
                gVM.playRandomIncorrectSound()
            }
            
            // Next turn
            gVM.gameModel.nextTurn()
        }
    }
}

#Preview {
    NumberOptionsView(numbers: [42, 13, 10, 38], answer: 10)
        .environment(GameViewModel())
}
