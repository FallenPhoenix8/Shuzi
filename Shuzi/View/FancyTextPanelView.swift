//
//  VeryCoolTextView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 08/07/2025.
//

import SwiftUI

struct FancyTextPanelView: View {
    // Texts
    let text1: String
    let text2: String
    let text3: String

    // Style properties
    let opacity: Double
    let scale: CGSize
    let angle: Angle
    let spacing: CGFloat
    let textOpacity: Double

    var body: some View {
        VStack(spacing: spacing) {
            TextReplacingOnChangeView(text: text1)
                .foregroundStyle(.red)
            TextReplacingOnChangeView(text: text2)
                .foregroundStyle(.yellow)
            TextReplacingOnChangeView(text: text3)
                .foregroundStyle(.red)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(
                    colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing
                ))
                .opacity(opacity)
        )
        .font(.title)
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
        .padding()
        .scaleEffect(scale)
        .rotation3DEffect(
            angle,
            axis: (
                x: 1,
                y: 0,
                z: 0
            )
        )
    }
}

#Preview {
    VStack {
        FancyTextPanelView(
            text1: "Line 1",
            text2: "Line 2",
            text3: "Line 3",
            opacity: 1,
            scale: CGSize(width: 1, height: 1),
            angle: Angle(degrees: 0),
            spacing: 25,
            textOpacity: 1
        )

        FancyTextPanelView(
            text1: "Line 1",
            text2: "Line 2",
            text3: "Line 3",
            opacity: 0,
            scale: CGSize(width: 0.5, height: 0.5),
            angle: Angle(degrees: 45),
            spacing: 5,
            textOpacity: 0.8
        )
    }
}
