//
//  ContainerView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 08/07/2025.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenPresented = true
    
    var body: some View {
        if isSplashScreenPresented {
            SplashScreenView(isPresented: $isSplashScreenPresented)
                .disabled(!isSplashScreenPresented)
        } else {
            MainView()
        }
    }
}

#Preview {
    ContainerView()
        .environment(GameViewModel())
}
