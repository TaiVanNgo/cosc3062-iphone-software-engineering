//
//  ContactListApp.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

@main
struct ContactListApp: App {
    var body: some Scene {
        WindowGroup {
            ContactList(contacts: Contact.sampleContacts)
        }
    }
}
