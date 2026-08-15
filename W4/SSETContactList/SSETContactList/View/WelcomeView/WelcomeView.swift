//
//  WelcomeView.swift
//  SSETContactList
//
//  Created by Van Tai on 24/7/26.
//

import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
    
    var body: some View {
        ZStack{
            if isWelcomeActive{
                GreetingView(active: $isWelcomeActive)
            } else{
                ContactList()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
