//
//  CircleRMITView.swift
//  SSETContactList
//
//  Created by Van Tai on 24/7/26.
//

import SwiftUI

struct CircleRMITView: View {
    var body: some View {
        ZStack{
            Circle()
                .stroke(.white.opacity(0.4), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(.white.opacity(0.4), lineWidth: 90)
                .frame(width: 260, height: 260, alignment: .center)
            
            Image("rmit-logo-white")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
        }
    }
}

#Preview {
    CircleRMITView()
}
