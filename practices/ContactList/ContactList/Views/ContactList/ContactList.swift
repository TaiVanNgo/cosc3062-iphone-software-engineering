//
//  ContactList.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct ContactList: View {
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
        }
        
    }
}

#Preview {
    ContactList(
        contacts: Contact.sampleContacts
    )
}
