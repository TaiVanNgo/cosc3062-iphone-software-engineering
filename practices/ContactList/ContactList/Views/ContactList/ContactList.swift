//
//  ContactList.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct ContactList: View {
    @Binding var isDarkTheme: Bool
    
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
    @Previewable @State var isDarkTheme = false
    ContactList(
        isDarkTheme: $isDarkTheme,
        contacts: Contact.sampleContacts
    )
}
