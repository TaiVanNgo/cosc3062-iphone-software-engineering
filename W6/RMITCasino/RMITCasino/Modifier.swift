//
//  Modifier.swift
//  RMITCasino
//
//  Created by Van Tai on 16/8/26.
//

import Foundation
import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(
                color: Color("BlackTransparent"), radius: 10
            )
    }
}

struct ScoreLabelModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .foregroundStyle(Color("BrandWhite"))
            .font(.headline)
            .fontWeight(.bold)
            .fontDesign(.rounded)
    }
}

struct ScoreNumberModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .foregroundStyle(Color("BrandWhite"))
            .font(.title2)
            .fontWeight(.heavy)
            .fontDesign(.rounded)
    }
}

struct ScoreCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                Capsule()
                    .foregroundStyle(Color("BlackTransparent"))
            )
    }
}

struct ReelImageModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .scaledToFit()
            .frame(minWidth: 140, idealWidth: 160, maxWidth: 200, alignment: .center)
            .modifier(ShadowModifier())
    }
}

struct IconImageModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .scaledToFit()
            .frame(minWidth: 80, idealWidth: 90, maxWidth: 100, alignment: .center)
            .modifier(ShadowModifier())
    }
}

struct BetCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .foregroundStyle(Color("BrandWhite"))
            .font(.title2)
            .fontWeight(.heavy)
            .fontDesign(.rounded)
            .modifier(ShadowModifier())
            .background(
                Capsule()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("BrandYellow"), Color("BrandRed")]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 80, height: 50, alignment: .center)
            )
    }
}

struct CasinoChipModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .scaledToFit()
            .frame(height: 70)
            .modifier(ShadowModifier())
    }
}
