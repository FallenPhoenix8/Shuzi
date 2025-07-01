//
//  ShuziApp.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 26/06/2025.
//

import SwiftUI

@main
struct ShuziApp: App {
    @State private var gVM: GameViewModel = .init()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(gVM)
        }
    }
}
