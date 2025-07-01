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
            
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
