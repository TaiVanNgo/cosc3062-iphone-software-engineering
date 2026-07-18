//
//  ContentView.swift
//  MyFirstApp
//
//  Created by Van Tai on 15/7/26.
//

import SwiftUI

struct ContentView: View {
    let allAnswers = [
        "With God all things are possible. - Matthew 19:26",
        "I can do all things through Christ which strengtheneth me. - Philippians 4:13",
        "The Lord is my shepherd; I shall not want. - Psalm 23:1",
        "Be strong and of a good courage. - Joshua 1:9",
        "God is love. - 1 John 4:8",
        "The Lord is good, a strong hold in the day of trouble. - Nahum 1:7",
        "Trust in the Lord with all thine heart. - Proverbs 3:5",
        "The joy of the Lord is your strength. - Nehemiah 8:10",
        "Peace I leave with you, my peace I give unto you. - John 14:27",
        "Fear not: for I am with thee. - Isaiah 41:10",
        "The Lord shall fight for you. - Exodus 14:14",
        "Cast thy burden upon the Lord, and he shall sustain thee. - Psalm 55:22",
        "For with God nothing shall be impossible. - Luke 1:37",
        "The Lord is nigh unto all them that call upon him. - Psalm 145:18",
        "Be still, and know that I am God. - Psalm 46:10",
        "We walk by faith, not by sight. - 2 Corinthians 5:7",
        "Let all that you do be done in love. - 1 Corinthians 16:14",
        "The Lord is my light and my salvation; whom shall I fear? - Psalm 27:1",
        "Pray without ceasing. - 1 Thessalonians 5:17",
        "Rejoice evermore. - 1 Thessalonians 5:16",
        "The Lord is faithful. - 2 Thessalonians 3:3",
        "Love never faileth. - 1 Corinthians 13:8",
        "Let not your heart be troubled. - John 14:1",
        "My grace is sufficient for thee. - 2 Corinthians 12:9"
    ]
    
    @State var quote = "Tap Jesus to receive a verse."
    @State var reference = ""

    var body: some View {
        ZStack{
          
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                ZStack{
                    Image("jesus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 210)
                        .clipShape(Circle())
                    
                    Image("magic-ball-empty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.5)){
                        let randomStr = allAnswers.randomElement()!
                        let separatedStr = randomStr.components(separatedBy: "-")
                        quote = separatedStr[0]
                        reference = separatedStr[1]
                    }
                }
                
                VStack{
                    Text("Jesus")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                }
                
                Text("Tap Jesus for a verse")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)

                
                HStackLayout(alignment: .center, spacing: 14){
                    HStack{
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        
                        Text("Love").fontWeight(.semibold)
                    }
                    HStack{
                        Image(systemName: "figure.stand")
                            .foregroundColor(.orange)
                            
                        Text("Humble").fontWeight(.semibold)
                    }
                    HStack{
                        Image(systemName: "hand.raised.fill")
                            .foregroundColor(.green)
                        Text("Forgiving").fontWeight(.semibold)
                    }
                }
                .padding()
                .foregroundColor(.blue.opacity(0.8))
                .background(.white)
                .cornerRadius(15)
                
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.black.opacity(0.6))
                    .frame(width: 300, height: 100)
                    .overlay(
                        VStack(spacing: 3){
                            Text(quote)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            HStack(){
                                Spacer()
                                
                                Text(reference)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .padding(.horizontal)
                        .frame(width: 300)
                    )
                
            }
        }
    }
}

#Preview {
    ContentView()
}
