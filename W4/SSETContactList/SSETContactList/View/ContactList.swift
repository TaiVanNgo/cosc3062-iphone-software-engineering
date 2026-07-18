//
//  ContactList.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import SwiftUI

struct ContactList: View {
    var body: some View{
        NavigationView{
            List(contacts) { contact in
                NavigationLink{
                    ContactCard(contact: contact)
                } label: {
                    ContactRow(contact: contact)
                }
            }
            .navigationTitle("SSET Contact List")
        }
    }
}
