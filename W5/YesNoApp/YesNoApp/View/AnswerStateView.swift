//
//  AnswerStateView.swift
//  YesNoApp
//
//  Created by Codex on 24/7/26.
//

import SwiftUI

struct AnswerStateView: View {
    let answer: YesNo?
    let isLoading: Bool
    let errorMessage: String?

    var body: some View {
        Group {
            if let answer {
                AnswerCard(answer: answer)
            } else if isLoading {
                ProgressView("Asking the universe…")
                    .frame(maxWidth: .infinity, minHeight: 280)
            } else {
                ContentUnavailableView(
                    "No Answer Yet",
                    systemImage: "wifi.exclamationmark",
                    description: Text(
                        errorMessage ?? "Tap Ask Again to request an answer."
                    )
                )
                .frame(maxWidth: .infinity, minHeight: 280)
            }
        }
    }
}
