//
//  UFO.swift
//  animation-practices
//
//  Created by Van Tai on 21/8/26.
//

import SwiftUI

struct Notification: View {
    @State private var notificationDrop: Bool = false

    var body: some View {
        HStack{
           Text("Oh Year Suprise")
        }
        .frame(width: 350, height: 100)
        .background(
            Color(.blue),
            in: RoundedRectangle(cornerRadius: 10)
        )
        .offset(y: notificationDrop ? 0 : -200)
        .animation(
            .spring(duration: 0.5, bounce: 0.4),
            value: notificationDrop
        )
        
        
        Spacer()
        
        Button("Click me for suprise!"){
            self.notificationDrop.toggle()
        }
        .buttonStyle(.borderedProminent)
        
        Spacer()
    }
}

#Preview {
    Notification()
}
