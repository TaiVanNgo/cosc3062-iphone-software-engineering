//
//  ScoreCapsuleModifier.swift
//  RmitCasino
//
//  Created by Van Tai on 16/9/26.
//

import Foundation

import SwiftUI

// MARK: - ViewModifier
struct ScoreCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.colorWhiteRMIT)
            .padding()
            .background(
                .colorBlackTransparentRMIT,
                in: Capsule()
            )
    }
}

// MARK: - View Extension
extension View {
    func scoreCapsuleModifier() -> some View {
        modifier(ScoreCapsuleModifier())
    }
}

