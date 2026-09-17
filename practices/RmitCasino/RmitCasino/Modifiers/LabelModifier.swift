//
//  ShadowModifier.swift
//  RmitCasino
//
//  Created by Van Tai on 16/9/26.
//

import SwiftUI

// MARK: - ViewModifier
struct ScoreLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.bold)
    }
}

struct ScoreNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.heavy)
    }
}

// MARK: - View Extension
extension View {
    func scoreLabelModifier() -> some View {
        modifier(ScoreLabelModifier())
    }
}

extension View {
    func scoreNumberModifier() -> some View {
        modifier(ScoreNumberModifier())
    }
}
