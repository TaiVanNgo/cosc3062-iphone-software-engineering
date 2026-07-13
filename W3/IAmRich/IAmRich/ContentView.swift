//
//  ContentView.swift
//  IAmRich
//
//  Created by Van Tai on 12/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.03, green: 0.03, blue: 0.35)
                .edgesIgnoringSafeArea(.all)
            
            Image("ronaldo")
                .resizable()
                .scaledToFit()
            
            Text("I am back!")
                .font(.system(size:40))
                .fontWeight(.bold)
                .foregroundColor(.red)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 70)
           
        }
    }
}
//
#Preview {
    ContentView()
}
