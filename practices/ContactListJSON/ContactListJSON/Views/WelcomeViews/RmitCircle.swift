//
//  RmitCircle.swift
//  ContactListJSON
//
//  Created by Van Tai on 16/9/26.
//

import SwiftUI

struct RmitCircle: View {
    var body: some View {
        
        ZStack{
            Circle()
                .stroke(.white.opacity(0.6), lineWidth: 40)
                .frame(width: 350, height: 350, alignment: .center)
            
            Circle()
                .stroke(.white.opacity(0.4), lineWidth: 90)
                .frame(width: 350, height: 350, alignment: .center)
            
            Image("rmit-logo-white")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 200)
        }
        
    }
}

#Preview {
    ZStack{
        Color(.rmitBlue)
            .ignoresSafeArea()
        RmitCircle()
    }
    
}
