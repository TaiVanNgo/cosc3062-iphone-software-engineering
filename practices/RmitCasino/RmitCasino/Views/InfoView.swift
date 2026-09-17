//
//  InfoView.swift
//  RmitCasino
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.colorBlueRMIT)
                    .ignoresSafeArea()
                
                VStack{
                    Button {
                        dismiss()
                    } label: {
                        HStack{
                            Spacer()
                            Image(systemName: "xmark.circle")
                                .font(.title)
                                .foregroundStyle(.colorWhiteRMIT)
                                .padding(.horizontal)
                        }   
                    }
                    
                    Image("rmit-casino-logo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(maxWidth: .infinity)
            
            Form {
                Section("How To Play".uppercased()) {
                    Text("Just spin the reels to play.")
                    Text("Matching all icons to win.")
                    Text("The winning amount will be 10x of your betting amount.")
                    Text("You can reset the money and highscore by clicking on the button Reset.")
                }
                
                Section("Application Information".uppercased()) {
                    HStack{
                        Text("Course")
                        Spacer()
                        Text("COSC3062")
                    }
                    
                    HStack{
                        Text("Year Published")
                        Spacer()
                        Text("2025")
                    }
                    
                    HStack{
                        Text("Location")
                        Spacer()
                        Text("Saigon South Campus")
                    }
                }
            }
        }
        
    }
    
    //    private func <#saveAction()#> {
    //        // Save logic here
    //        dismiss()
    //    }
}
#Preview {
    InfoView()
}
