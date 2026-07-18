//
//  InfoView.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import SwiftUI

struct InfoView: View {
    var text: String
    var iconName: String
    
    var body: some View{
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(height: 50)
            .overlay(
                HStack{
                    Image(systemName: iconName)
                        .foregroundStyle(.rmitRed)
                    Text(text)
                        .foregroundStyle(.rmitBlue)
                }
            )
    }
}

#Preview {
    ZStack {
        Color("rmit-blue")
            .ignoresSafeArea()
        VStack {
            InfoView(text: "0123456789", iconName: "phone.fill")
            InfoView(text: "tom.huynh@rmit.edu.vn", iconName: "envelope.fill")
        }
    }
}
