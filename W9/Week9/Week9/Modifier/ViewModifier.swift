import Foundation
import SwiftUI

struct CapsuleButtonAppearance: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                Capsule()
                    .foregroundColor(.red)
            )
            .shadow(color: .black, radius: 7)
  }
}

extension View{
    func capsuleButtonAppearance() -> some View{
        self.modifier(CapsuleButtonAppearance())
    }
}
