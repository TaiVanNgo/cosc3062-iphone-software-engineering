//
//  ReelModifier.swift
//  RmitCasino
//
//  Created by Van Tai on 16/9/26.
//

import Foundation

import SwiftUI

// MARK: - ViewModifier
struct ReelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 200)
            .shadowModifier()
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 100)
            .shadowModifier()
    }
}

// MARK: - View Extension
extension View {
    func reelModifier() -> some View {
        modifier(ReelModifier())
    }
}


extension View {
    func iconModifier() -> some View {
        modifier(IconModifier())
    }
}

