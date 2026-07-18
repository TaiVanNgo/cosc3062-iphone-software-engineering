//
//  CircleView.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import SwiftUI

struct CircleView: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color("rmit-red"), lineWidth: 3)
            )
            .shadow(color: Color("rmit-blue").opacity(0.35), radius: 10)
    }
}

#Preview {
    CircleView(image: contacts[0].image)
}
