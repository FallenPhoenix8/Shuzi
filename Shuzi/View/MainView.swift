//
//  ContentView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 26/06/2025.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVM
    @State private var showSettingsView = false
    @State private var showPinyin: Bool = true
    
    @State private var done: Bool = false
    
    var gameOver: Bool {
        gVM.gameModel.gameWon
    }

    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)

            VStack {
                ScoreView(
                    score: gVM.gameModel.score,
                    maxTurns: gVM.gameModel.maxTurns
                )
                .padding()

                Toggle(showPinyin ? "Hide Pinyin" : "Show Pinyin", isOn: $showPinyin.animation())
                    .padding(.horizontal)

                if let chineseNum = gVM.gameModel.answer.num99ToChinese() {
                    
                    Spacer()
                    
                    Text(chineseNum.chinese)
                        .font(showPinyin ? .title : .largeTitle)
                        .fontWeight(.semibold)
                    
                    if showPinyin {
                        Text(chineseNum.pinyin)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
                
                NumberOptionsView(
                    numbers: gVM.gameModel.alternatives, answer: gVM.gameModel.answer)
                .onChange(of: gVM.gameModel.turns) { _, _ in
                    gVM.gameModel.generateNewProblem()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.vertical)
        }
        .fullScreenCover(isPresented: $done) {
            GameOverView(color: .green.opacity(0.8))
        }
        .fullScreenCover(isPresented: $showSettingsView) {
            SettingsView(showSettingsView: $showSettingsView, volume: gVM.gameModel.volume)
        }
        .onChange(of: gameOver) { _, _ in
            done = gameOver
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
