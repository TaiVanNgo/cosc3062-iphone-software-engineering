//
//  ContactRow.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        HStack{
            contact.image
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(
                    .rect(cornerRadius: 10)
                )
                
            Text(contact.name)
        }
    }
}
//
//#Preview {
//    List{
//        ContactRow(
//            contact: .sampleContact
//        )
//        
//        ContactRow(
//            contact: .sampleContacts[1]
//        )
//        ContactRow(
//            contact: .sampleContacts[2]
//        )
//    }
//  
//}
