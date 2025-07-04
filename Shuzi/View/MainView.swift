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
                
                Toggle(showPinyin ? "Hide Pinyin": "Show Pinyin", isOn: $showPinyin.animation())
                    .padding(.horizontal)
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
