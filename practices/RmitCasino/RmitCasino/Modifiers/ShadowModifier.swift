//
//  ShadowModifier.swift
//  RmitCasino
//
//  Created by Van Tai on 16/9/26.
//

import SwiftUI

// MARK: - ViewModifier
struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(
                color: .colorBlackTransparentRMIT, radius: 10
            )
    }
}

// MARK: - View Extension
extension View {
    func shadowModifier() -> some View {
        modifier(ShadowModifier())
    }
}
