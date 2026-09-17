//
//  GreetingView.swift
//  ContactListJSON
//
//  Created by Van Tai on 16/9/26.
//

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    
    var body: some View {
        ZStack{
            Color(.rmitBlue)
                .ignoresSafeArea()
            
            VStack(spacing: 10){
                Spacer()
                
                Text("Welcome")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundStyle(.white)
                
                Text("""
                     The Contact List is long
                     The Circle is small!
                     """
                )
                .font(.headline)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                
                Spacer()
                
                RmitCircle()
                
                Spacer()
                
                Button {
                    active.toggle()
                } label: {
                    Text("Get Started")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            .white.opacity(0.5),
                            in: Capsule()
                        )
                }
                .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    
    GreetingView(active: .constant(true))
    
    
}
