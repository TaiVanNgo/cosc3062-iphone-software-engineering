import Foundation
import SwiftUI

struct BrandingFont: ViewModifier {
    var size: CGFloat
    var textStyle: Font.TextStyle
    
    func body(content: Content) -> some View {
        content
          .font(.custom("PressStart2P", size: size, relativeTo: textStyle))
  }
}

extension View{
    func brandingFont(size: CGFloat, relativeTo textStyle: Font.TextStyle = .body) -> some View{
        self.modifier(BrandingFont(size: size, textStyle: textStyle))
    }
}
