//
//  ContactCard.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct ContactCard: View {
    let contact: Contact
    
    var body: some View {
        ZStack{
            Color(.rmitBlue)
                .ignoresSafeArea()
            
            VStack{
                CircleImage(imageName: contact.imageName)
                
                Text(contact.name)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .fontDesign(.serif)
                
                Image(.rmitLogoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                Group{
                    InfoView(
                        text: contact.email,
                        iconName: "envelope.fill"
                    )
                    
                    InfoView(
                        text: contact.phoneNumber,
                        iconName: "phone.fill"
                    )
                }
                .padding(.horizontal)
            }
        }
        .toolbarBackground(.rmitBlue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar) // This makes the back button white

    }
}

#Preview {
    NavigationStack{
        ContactCard(
            contact: Contact.sampleContact
        )
    }
}
