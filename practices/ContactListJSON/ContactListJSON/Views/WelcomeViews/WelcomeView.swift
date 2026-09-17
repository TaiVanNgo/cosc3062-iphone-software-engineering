//
//  WelcomeView.swift
//  ContactListJSON
//
//  Created by Van Tai on 16/9/26.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isWelcomeActive: Bool = true
    
    var body: some View {
        if isWelcomeActive {
            GreetingView(
                active: $isWelcomeActive
            )
        }else {
            ContactList(
                contacts: contacts
            )
        }
    }
}

#Preview {
    WelcomeView()
}
