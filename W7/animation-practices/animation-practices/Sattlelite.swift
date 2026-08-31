//
//  Sattlelite.swift
//  animation-practices
//
//  Created by Van Tai on 21/8/26.
//

import SwiftUI

struct Sattlelite: View {
    @State private var spinIcon: Bool = false
    
    var body: some View {
        Spacer()
        
        Text("🛰️")
            .font(.system(size: 100))
            .scaleEffect(self.spinIcon ? 2 : 1)
            .rotationEffect(.degrees(self.spinIcon ? 360 : 0))
            .offset(x: self.spinIcon ? 80 : 0, y: spinIcon ? -120 : 0)
        
        Text("🛸")
            .font(.system(size: 100))
            .scaleEffect(self.spinIcon ? 2 : 1)
            .rotationEffect(.degrees(self.spinIcon ? 360 : 0))
            .offset(x: self.spinIcon ? -80 : 0, y: spinIcon ? -120 : 0)

        
        Spacer()
        
        Button("Press me for cool animation") {
            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 100, damping: 10, initialVelocity: 0)) {
                self.spinIcon.toggle()
            }
        }
        .padding()
        .background(.red)
        .foregroundColor(.white)
        
        Spacer()
    }
}

#Preview {
    Sattlelite()
}
