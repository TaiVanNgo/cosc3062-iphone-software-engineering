//
//  ContactList.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct ContactList: View {
    @AppStorage("isDarkTheme") var isDarkTheme = false
    let contacts: [Contact]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts, id: \Contact.name) { contact in
                    NavigationLink {
                        ContactCard(contact: contact)
                    } label: {
                        ContactRow(contact: contact)
                    }
                }
            }
            .navigationTitle("SSET Contact List 📒")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        isDarkTheme ? "Use Light Theme"  : "Use Dark Theme",
                        systemImage: isDarkTheme ? "moon.fill" : "sun.max.fill",
                    ) {
                        isDarkTheme.toggle()
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    ContactList(
        contacts: contacts
    )
}

