//
//  ContactRow.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//
import SwiftUI

struct ContactRow: View{
    var contact: Contact
    
    var body: some View{
        HStack{
            contact.image
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            Text(contact.name)
        }
    }
}

#Preview {
    VStack {
        ContactRow(contact: contacts[0])
        ContactRow(contact: contacts[1])
        ContactRow(contact: contacts[2])
        ContactRow(contact: contacts[3])
        ContactRow(contact: contacts[4])
    }
}
