//
//  ContentView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 26/06/2025.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVM
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Success") {
                gVM.playRandomSuccessSound()
            }
            Button("Incorrect") {
                gVM.playRandomIncorrectSound()
            }
            
            Button("7") {
                gVM.playNumber(num: 7)
            }
            .padding()
            
            Button("30") {
                gVM.playNumber(num: 30)
            }
            .padding()
            
            Button("74") {
                gVM.playNumber(num: 74)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
