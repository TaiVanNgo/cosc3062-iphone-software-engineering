//
//  ContentView.swift
//  week10
//
//  Created by Van Tai on 2/9/26.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {    
    @State private var user: User?
    
    var body: some View {
        if let user {
            MovieView(user: user)
        } else {
            LoginView(user: $user)
        }
    }
    
}

#Preview {
    ContentView()
}
