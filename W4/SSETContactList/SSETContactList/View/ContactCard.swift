//
//  ContactCard.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import SwiftUI
struct ContactCard: View {
    var contact: Contact
    
    var body: some View{
        ZStack{
            Color("rmit-blue")
                .ignoresSafeArea()
            VStack(){
                MapView(myLocation: contact.locationCoordinate)
                    .frame(height: 250)
            
                CircleView(image: contact.image)
                    .offset(y: -160)
                    .padding(.bottom, -100)
                Text(contact.name)
                    .font(.system(size: 40, weight: .bold, design:.serif))
                    .foregroundStyle(.white)
                
                Image("rmit-logo-white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 225)
                
                VStack(spacing: 20){
                    InfoView(text: contact.phone, iconName: "phone.fill")
                        .padding(.horizontal)
                    InfoView(text: contact.email, iconName: "envelope.fill")
                        .padding(.horizontal)
                }
                
            }
        }
        .toolbarBackground(
                    Color("rmit-blue"),
                    for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    ContactCard(contact: contacts[1])
}
