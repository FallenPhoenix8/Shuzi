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

                if let chineseNum = Chinese.num99ToChinese(gVM.gameModel.answer) {
                    
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
                
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
