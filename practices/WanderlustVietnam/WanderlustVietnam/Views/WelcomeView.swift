//
//  WelcomeView.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

struct WelcomeView: View {
    @State var isAnimating = true
    
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack{
            Color(.background)
                .ignoresSafeArea()
            
            VStack{
                Image("app-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 1)){
                            isAnimating.toggle()
                        }
                    }
                
                Text("Wanderlust Vietnam")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundStyle(.brandPrimary)
                
                Text("Ngo Van Tai")
                    .font(.custom("Sacramento-Regular", size: 35))
                    .foregroundStyle(.brandSecondary)
                
                Text("S3974892")
                    .font(.custom("Sacramento-Regular", size: 35))
                    .foregroundStyle(.brandSecondary)
                
                Button {
                    isActive = false
                } label: {
                    Text("Explore Destination")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            .brandPrimary,
                            in: .rect(cornerRadius: 10)
                        )
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    WelcomeView(
        isActive: .constant(true)
    )
}
