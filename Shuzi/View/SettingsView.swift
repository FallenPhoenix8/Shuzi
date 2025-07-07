//
//  SettingsView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 07/07/2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(GameViewModel.self) var gVM
    @Binding var showSettingsView: Bool

    @State var volume: Float

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        HStack {
                            SpeakerIconView(volume: volume)
                            Text("Volume")
                            Spacer()
                            Slider(value: $volume, in: 0 ... 1)
                        }
                    } header: {
                        Text("Audio Settings")
                    }
                }

                Button("Ok") {
                    gVM.gameModel.volume = volume
                    showSettingsView.toggle()
                }
            }
            .navigationTitle("Game Settings")
        }
    }
}

#Preview {
    SettingsView(showSettingsView: .constant(true), volume: 0.7)
        .environment(GameViewModel())
}
