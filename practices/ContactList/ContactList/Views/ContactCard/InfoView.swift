//
//  InfoView.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let iconName: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .foregroundStyle(.red)
            Text(text)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            .white,
            in: Capsule()
        )
        
    }
}

#Preview {
    ZStack{
        Color(.rmitBlue)
            .ignoresSafeArea()
        
        
        VStack{
            InfoView(
                text: "tom.huynh@rmit.edu.vn",
                iconName: "envelope.fill"
            )
            
            InfoView(
                text: "tom.huynh@rmit.edu.vn",
                iconName: "phone.fill"
            )
        }
        .padding(.horizontal)

    }
    
}
