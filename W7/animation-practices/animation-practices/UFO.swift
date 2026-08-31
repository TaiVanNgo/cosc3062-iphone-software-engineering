//
//  UFO.swift
//  animation-practices
//
//  Created by Van Tai on 21/8/26.
//

import SwiftUI

struct UFO: View {
    @State private var startRacing: Bool = false

    var body: some View {
        Button("Start Racing!"){
            self.startRacing.toggle()
        }
        
        HStack{
            Text("🛸")
                .font(.system(size: 60))
                .frame(maxWidth: .infinity, alignment: self.startRacing ? .trailing : .leading)
                .animation(
                    .interpolatingSpring(mass: 2.0, stiffness: 100.0, damping: 10.0, initialVelocity: 0),
                    value: startRacing
                )
            
        }
    }
}

#Preview {
    UFO()
}
