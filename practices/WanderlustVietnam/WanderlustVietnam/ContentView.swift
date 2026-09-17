//
//  ContentView.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI

struct ContentView: View {
    @State var isGreet = true
    var body: some View {
        if isGreet{
            WelcomeView(isActive: $isGreet)
        } else {
            Destinations(destinations: destinationData)
        }
    }
}

#Preview {
    ContentView()
}
