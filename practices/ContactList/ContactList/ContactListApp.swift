//
//  ContactListApp.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

@main
struct ContactListApp: App {
    @AppStorage("isDarkTheme") private var isDarkTheme = false
    
    var body: some Scene {
        WindowGroup {
            ContactList(
                isDarkTheme: $isDarkTheme,
                contacts: Contact.sampleContacts
            )
            .preferredColorScheme(isDarkTheme ? .dark : .light)
        }
    }
}
