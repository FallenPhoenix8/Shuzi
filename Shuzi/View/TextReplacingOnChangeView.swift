//
//  TextReplacingOnChangeView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 08/07/2025.
//

import SwiftUI

struct TextReplacingOnChangeView: View {
    let text: String
    
    @State private var scale: CGFloat = 1
    @State private var opacity: Double = 1
    
    
    var body: some View {
        Text(text)
            .scaleEffect(scale)
            .opacity(opacity)
            .onChange(of: text) {
                
                withAnimation(.easeOut(duration: 0.25)) {
                    scale = 0
                    opacity = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation {
                        scale = 1
                        opacity = 1
                    }
                }
                
            }
    }
}

#Preview {
    @Previewable @State var text = "Some text"
    TextReplacingOnChangeView(text: text)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                text = "New text"
            }
        }
}
