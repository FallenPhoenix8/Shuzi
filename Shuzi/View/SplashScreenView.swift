//
//  SplashScreenView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 08/07/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool

    @State private var opacity = 0.0
    @State private var scale = CGSize(width: 0.5, height: 0.5)
    @State private var moveUp = false
    @State private var angle = Angle(degrees: 45)
    @State private var spacing = 5.0
    @State private var textOpacity: Double = 0.8

    var vm = ProverbViewModel()

    // Quote text
    var chinese: String {
        vm.proverbModel.proverb
    }

    var pinyin: String {
        vm.proverbModel.pinyin
    }

    var englishTranslation: String {
        vm.proverbModel.translation
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color
                    .black
                    .ignoresSafeArea()

                Image("china1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .opacity(opacity)

                // Quote
                VStack {
                    FancyTextPanelView(
                        text1: chinese,
                        text2: pinyin,
                        text3: englishTranslation,
                        opacity: opacity,
                        scale: scale,
                        angle: angle,
                        spacing: spacing,
                        textOpacity: textOpacity
                    )

                    if moveUp {
                        Spacer()
                    }
                }

                // Button
                VStack {
                    Spacer()
                    Button(
                        action: {
                            withAnimation {
                                isPresented.toggle()
                            }
                        },
                        label: {
                            Image("friend")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 75)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .stroke(Color.red, lineWidth: 1)
                                )
                        }
                    )
                }
            }
        }
        .onAppear {
            vm.getRandomQuote()

            withAnimation(.easeIn(duration: 1.5)) {
                opacity = 0.8
                scale = CGSize(width: 1, height: 1)
                angle = Angle(degrees: 0)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 1)) {
                    moveUp = true
                    spacing = 50
                    textOpacity = 1
                    
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 1)) {
                    isPresented = false
                }
            }
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
