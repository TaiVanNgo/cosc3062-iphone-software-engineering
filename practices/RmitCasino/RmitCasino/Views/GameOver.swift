//
//  GameOver.swift
//  RmitCasino
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

struct GameOver: View {
    
    @Binding var showModal: Bool
    @Binding var coins: Int
    
    var body: some View {
        ZStack{
            Color(.colorBlackTransparentRMIT)
                .ignoresSafeArea()
            
            VStack{
                Text("Game Over".uppercased())
                    .font(.title)
                    .foregroundStyle(.colorWhiteRMIT)
                    .fontDesign(.rounded)
                    .padding()
                    .frame(width: 300)
                    .background(
                        .colorRedRMIT,
                        in: .rect(cornerRadius: 10)
                    )
                
                VStack{
                    Image("rmit-casino-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    
                    Text(
                        """
                        You lost all money!
                        You are not the god of gambler!
                        Good luck next time!
                        """
                    )
                    .foregroundStyle(.colorWhiteRMIT)
                    .multilineTextAlignment(.center)
                    
                    
                    Button {
                        coins = 200
                        showModal = false
                    } label: {
                        Text("New Game".uppercased())
                            .foregroundStyle(.colorWhiteRMIT)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundStyle(.colorRedRMIT)
                                
                            )
                    }
                    .buttonStyle(.plain)
                    
                }
            }
            .onAppear{
                playSound(
                    sound: "drum-music", type: "mp3"
                )
            }
            .padding()
            .background(
                .colorBlueRMIT,
                in: .rect(cornerRadius: 10)
            )
        }
    }
}

#Preview {
    GameOver(
        showModal: .constant(true),
        coins: .constant(100)
    )
}
