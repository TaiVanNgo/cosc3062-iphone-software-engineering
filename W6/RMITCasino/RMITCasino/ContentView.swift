//
//  ContentView.swift
//  RMITCasino
//
//  Created by Van Tai on 16/8/26.
//

import SwiftUI

struct ContentView: View {
    let icons = ["apple","bar","cherry","clover","diamond", "grape", "heart", "horseshoe","lemon","melon","money","orange"]
    
    @State private var reels = [0, 1, 2]
    
    func spinReels(){
        reels = reels.map { _ in
            return Int.random(in: 0...icons.count - 1)
        }
    }


    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(
                    colors: [Color("BrandRed"), Color("BrandPurple")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack{
                LogoView(logoFileName: "rmit-casino-welcome-logo")
                
                HStack{
                    HStack{
                        Text("Your\nMoney".uppercased())
                            .multilineTextAlignment(.leading)
                            .modifier(ScoreLabelModifier())
                        
                        Text("100")
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreCapsuleModifier())
                    
                    Spacer()
                    
                    HStack{
                        Text("100")
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .multilineTextAlignment(.trailing)
                            .modifier(ScoreLabelModifier())
                    }
                    .modifier(ScoreCapsuleModifier())
                }
                
                VStack{
                    Image("reel")
                        .resizable()
                        .modifier(ReelImageModifier())
                        .overlay {
                            Image(icons[reels[0]])
                                .resizable()
                                .modifier(IconImageModifier())
                        }
                    
                    HStack{
                        Image("reel")
                            .resizable()
                            .modifier(ReelImageModifier())
                            .overlay {
                                Image(icons[reels[1]])
                                    .resizable()
                                    .modifier(IconImageModifier())
                            }
                        
                        Spacer()
                        
                        Image("reel")
                            .resizable()
                            .modifier(ReelImageModifier())
                            .overlay {
                                Image(icons[reels[2]])
                                    .resizable()
                                    .modifier(IconImageModifier())
                            }
                    }
                    
                    Button(action: {
                       spinReels()
                    }, label: {
                        Image("spin")
                            .resizable()
                            .modifier(ReelImageModifier())
                    })
                }
                
                HStack {
                    HStack(spacing: 30){
                        Text("20")
                            .modifier(BetCapsuleModifier())
                        
                        Image("casino-chips")
                            .resizable()
                            .modifier(CasinoChipModifier())
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 30){
                        Image("casino-chips")
                            .resizable()
                            .modifier(CasinoChipModifier())
                            .opacity(0)
                        
                        Text("10")
                            .modifier(BetCapsuleModifier())
                    }
                    
                }
                .padding(.horizontal, 20)
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
