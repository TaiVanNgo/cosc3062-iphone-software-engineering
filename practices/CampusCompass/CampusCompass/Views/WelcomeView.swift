//
//  WelcomeView.swift
//  CampusCompass
//
//  Created by Van Tai on 18/9/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack (spacing: 20){
            Image(systemName: "safari.fill")
                .font(.system(size: 170))
                .foregroundStyle(.study)
                .shadow(radius: 6)
            
            Text(
                """
                Campus
                Compass
                """
            )
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.brandPrimary)
            .multilineTextAlignment(.center)
            
            Text("Find your next place")
                .font(.title3)
                .bold()
                .foregroundStyle(.brandSecondary)
            
            Text("Ngo Van Tai")
                .font(.body)
                .foregroundStyle(.gray)
                
            Text("S3974892")
                .font(.body)
                .foregroundStyle(.gray)

            Button {
                
            } label: {
                Text("Explore Campus")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.headline)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.brandPrimary)
                            .shadow(radius: 4)
                    )
            }
            .buttonStyle(.plain)
        }
      
    }
}

#Preview {
    WelcomeView()
}
