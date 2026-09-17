//
//  CircleImage.swift
//  ContactList
//
//  Created by Van Tai on 15/9/26.
//

import SwiftUI

struct CircleImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay{
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundStyle(.white)
            }
    }
}

#Preview {
    CircleImage(
        imageName: "tom-huynh"
    )
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.rmitBlue)
}



