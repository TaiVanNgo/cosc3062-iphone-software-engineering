//
//  ContentView.swift
//  animation-practices
//
//  Created by Van Tai on 21/8/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            Button("Press Me!") {
                showDetails.toggle()
            }
            
            HStack{
                Text(showDetails ? "Hide Details" : "Show Details")
                Image(systemName: "chevron.up.square")
                    .rotationEffect(.degrees(showDetails ? 0 : 180))
                    .animation(.easeOut, value: showDetails)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
