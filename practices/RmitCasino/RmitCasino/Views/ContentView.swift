//
//  ContentView.swift
//  RmitCasino
//
//  Created by Van Tai on 16/9/26.
//

import SwiftUI

struct ContentView: View {
    let icons = ["apple","bar","cherry","clover","diamond", "grape", "heart", "horseshoe","lemon","melon","money","orange"]
    @State private var reels = [0,1,2]
    
    @State private var coins = 200
    @State private var betAmount = 10
    @AppStorage("highScore") private var highScore = 0 // persisted

    @State private var isBet10Select = true
    @State private var isBet20Select = false
    
    @State var animatingIcon = true
    
    @State var isShowInfoView = false
    @State var isShowLoosingModal = false
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(
                    colors: [Color("ColorRedRMIT"), Color("ColorPurpleRMIT")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack{
                HStack{
                    Spacer()
                    Button {
                        isShowInfoView.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal)
                }
                
                Image("rmit-casino-welcome-logo")
                    .resizable()
                    .scaledToFit()
                    .shadowModifier()
                HStack{
                    HStack{
                        Text("Your\nMoney".uppercased())
                            .scoreLabelModifier()
                        
                        Text("\(coins)")
                            .scoreNumberModifier()
                    }
                    .scoreCapsuleModifier()
                    
                    
                    Spacer()
                    
                    HStack{
                        Text("\(highScore)")
                            .scoreNumberModifier()
                        
                        Text("High\nScore".uppercased())
                            .multilineTextAlignment(.trailing)
                            .scoreLabelModifier()
                    }
                    .scoreCapsuleModifier()
                }
                
                ReelView(
                    reelIcon: icons[reels[0]],
                    animationIcon: animatingIcon
                )
                
                HStack{
                    ReelView(
                        reelIcon: icons[reels[1]],
                        animationIcon: animatingIcon
                    )
                    
                    Spacer()
                    
                    ReelView(
                        reelIcon: icons[reels[2]],
                        animationIcon: animatingIcon
                    )
                }
                
                Button {
                    
                    withAnimation(.easeOut(duration: 0.3)) {
                        animatingIcon = false
                        spinReel()
                    }
                    
                    withAnimation(.easeOut(duration: 0.7).delay(0.3)) {
                        animatingIcon = true
                        spinReel()
                    }
                    
                    checkWining()
                } label: {
                    Image("spin")
                        .resizable()
                        .reelModifier()
                }
                .buttonStyle(.plain)
                
                HStack{
                    HStack{
                        Button {
                            isBet20Select = true
                            isBet10Select = false
                            betAmount = 20
                            playSound(sound: "bet-chip", type: "mp3")
                        } label: {
                            Text("20")
                                .chipModifier()
                        }
                        
                            
                        Image("casino-chips")
                            .resizable()
                            .chipIconModifier()
                            .opacity(isBet20Select ? 1 : 0)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Image("casino-chips")
                            .resizable()
                            .chipIconModifier()
                            .opacity(isBet10Select ? 1 : 0)
                        Button {
                            isBet10Select = true
                            isBet20Select = false
                            betAmount = 10
                            playSound(sound: "bet-chip", type: "mp3")
                        } label: {
                            Text("10")
                                .chipModifier()
                        }
                    }
                }
            }
            .sheet(isPresented: $isShowInfoView){
                InfoView()
            }
            .onAppear{
//                highScore = 0
            }
            .padding(.horizontal)
            .blur(radius:  isShowLoosingModal ? 5 : 0 , opaque: false)

            
            if isShowLoosingModal {
                GameOver(
                    showModal: $isShowLoosingModal,
                    coins: $coins
                )
            }
        }
        
    }
    
    private func spinReel(){
        reels = reels.map { _ in
            Int.random(in:0..<12)
        }
        
        playSound(sound: "spin", type: "mp3")
    }
    
    private func checkWining(){
        if(
            icons[reels[0]] == icons[reels[1]]
           && icons[reels[1]] == icons[reels[2]]
        ){
            playerWin(isTripple: true)
        } else if (
            icons[reels[0]] == icons[reels[1]] || icons[reels[0]] == icons[reels[2]]
        ){
            playerWin(isTripple: false)
        } else {
            playerLose()
        }
    }
    
   
    
    private func playerWin(isTripple: Bool){
        if coins > highScore{
            highScore = coins //update new high score
            playSound(sound: "highscore", type: "mp3")
        }
        
        if isTripple{
            coins += betAmount * 10
        }
        
        coins += betAmount
        playSound(sound: "winning", type: "mp3")

    }
    
    private func playerLose(){
        var coinsAfterLoose = coins - betAmount
        
        if(coinsAfterLoose <= 0){ // loose the game
            isShowLoosingModal = true
            coins = 0
        } else{
            coins = coinsAfterLoose // apply coin
        }
    }

}

#Preview {
    ContentView()
}
