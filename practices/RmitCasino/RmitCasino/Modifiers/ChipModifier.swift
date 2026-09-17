//
//  ChipModifier.swift
//  RmitCasino
//
//  Created by Van Tai on 16/9/26.
//

import Foundation
import SwiftUI

// MARK: - ViewModifier
struct ChipModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .foregroundStyle(.colorWhiteRMIT)
            .padding(.horizontal, 30)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("ColorYellowRMIT"), Color("ColorRedRMIT")]), startPoint: .top, endPoint: .bottom)
                    )
            )
    }
}

struct ChipIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 50)
            .shadowModifier()
    }
}

// MARK: - View Extension
extension View {
    func chipModifier() -> some View {
        modifier(ChipModifier())
    }
}


extension View {
    func chipIconModifier() -> some View {
        modifier(ChipIconModifier())
    }
}

