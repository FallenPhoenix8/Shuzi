//
//  SpeakerIconView.swift
//  Shuzi
//
//  Created by Łukasz Kwiecień on 07/07/2025.
//

import SwiftUI

struct SpeakerIconView: View {
    enum Variant: String {
        case slash = "speaker.slash.fill"
        case wave1 = "speaker.wave.1.fill"
        case wave2 = "speaker.wave.2.fill"
        case wave3 = "speaker.wave.3.fill"
    }

    let volume: Float
    var speakerIcon: Variant {
        if volume == 0 {
            return .slash
        } else if volume <= 0.3 {
            return .wave1
        } else if volume <= 0.6 {
            return .wave2
        } else {
            return .wave3
        }
    }

    var body: some View {
        ZStack {
            Image(systemName: speakerIcon == .slash ? Variant.slash.rawValue : "speaker.fill")
                .contentTransition(.symbolEffect(.replace))
                .opacity(volume == 0 ? 1 : 0)
                            
            Image(systemName: speakerIcon != .slash ? speakerIcon.rawValue : "")
                .contentTransition(.symbolEffect(.replace))
            
        }
    }
}

#Preview {
    SpeakerIconView(volume: 0.2)
}
