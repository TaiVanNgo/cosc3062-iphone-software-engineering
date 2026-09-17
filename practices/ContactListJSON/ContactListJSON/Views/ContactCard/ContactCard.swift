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
                MapView(location: contact.locationCoordinate)
                    .frame(height: 250)
                
                CircleImage(imageName: contact.imageName)
                    .offset(y: -100)
                    .padding(.bottom, -100)
                
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
                        text: contact.phone,
                        iconName: "phone.fill"
                    )
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .toolbarBackground(.rmitBlue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)

    }
}

//#Preview {
//    NavigationStack{
//        ContactCard(
//            contact: Contact.sampleContact
//        )
//    }
//}
