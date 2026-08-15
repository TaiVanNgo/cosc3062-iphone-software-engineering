//
//  AnswerCard.swift
//  YesNoApp
//
//  Created by Codex on 24/7/26.
//

import SwiftUI

struct AnswerCard: View {
    let answer: YesNo
    
    var body: some View {
        VStack {
            Image(systemName: symbolName)
                .font(.title)
                .foregroundStyle(.white)
                .frame(width: 64, height: 64)
                .background(answerColor.gradient, in: .circle)
                .accessibilityHidden(true)
            
            Text("The universe says")
                .font(.headline)
                .foregroundStyle(.secondary)
            
            Text(answer.answer.uppercased())
                .font(.largeTitle)
                .bold()
                .foregroundStyle(answerColor)
            
            GifImageView(url: answer.image)
                .frame(maxWidth: .infinity)
                .aspectRatio(4 / 3, contentMode: .fit)
                .clipShape(.rect(cornerRadius: 24))
                .overlay {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.white.opacity(0.35), lineWidth: 1)
                }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 28))
        .shadow(color: .black.opacity(0.12), radius: 18, y: 10)
        .accessibilityElement(children: .combine)
    }
    
    private var normalizedAnswer: String {
        answer.answer.lowercased()
    }
    
    private var symbolName: String {
        switch normalizedAnswer {
        case "yes":
            "checkmark"
        case "no":
            "xmark"
        default:
            "questionmark"
        }
    }
    
    private var answerColor: Color {
        switch normalizedAnswer {
        case "yes":
                .green
        case "no":
                .red
        default:
                .orange
        }
    }
}

#Preview {
    if let imageURL = URL(
           string: "https://yesno.wtf/assets/yes/4-c53643ecec77153eefb461e053fb4947.gif"
       ) {
           AnswerCard(
               answer: YesNo(
                   answer: "Yes",
                   forced: false,
                   image: imageURL
               )
           )
       } else {
           ContentUnavailableView(
               "Invalid preview URL",
               systemImage: "exclamationmark.triangle"
           )
       }
}
