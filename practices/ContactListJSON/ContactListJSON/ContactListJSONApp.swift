//
//  ContactListJSONApp.swift
//  ContactListJSON
//
//  Created by Van Tai on 16/9/26.
//

import SwiftUI

@main
struct ContactListJSONApp: App {
    @AppStorage("isDarkTheme") private var isDarkTheme = false
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .preferredColorScheme(isDarkTheme ? .dark : .light)
        }
    }
}
