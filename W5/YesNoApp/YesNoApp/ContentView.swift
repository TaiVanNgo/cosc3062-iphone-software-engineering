//
//  ContentView.swift
//  YesNoApp
//
//  Created by Van Tai on 24/7/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = YesNoViewModel()

    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 24)

                Image(systemName: "sparkles")
                    .font(.largeTitle)
                    .foregroundStyle(.indigo)
                    .accessibilityHidden(true)

                Text("Ask the Universe")
                    .font(.largeTitle)
                    .bold()

                Text("Need a quick decision? Get a fresh yes or no whenever you need one.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                AnswerStateView(
                    answer: viewModel.answer,
                    isLoading: viewModel.isLoading,
                    errorMessage: viewModel.errorMessage
                )

                if let errorMessage = viewModel.errorMessage,
                   viewModel.answer != nil {
                    Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                        .font(.footnote)
                        .foregroundStyle(.orange)
                        .multilineTextAlignment(.center)
                }

                Button(action: refreshAnswer) {
                    Label(
                        viewModel.isLoading ? "Asking…" : "Ask Again",
                        systemImage: viewModel.isLoading ? "hourglass" : "arrow.clockwise"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(viewModel.isLoading)
                .accessibilityHint("Fetches a new answer from the yes or no service")

                Spacer(minLength: 24)
            }
            .frame(maxWidth: 560)
            .padding()
            .frame(maxWidth: .infinity)
        }
        .scrollIndicators(.hidden)
        .background {
            LinearGradient(
                colors: [
                    Color.indigo.opacity(0.24),
                    Color.cyan.opacity(0.12),
                    Color.clear
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        }
        .task {
            await viewModel.fetchAnswer()
        }
    }

    private func refreshAnswer() {
        Task {
            await viewModel.fetchAnswer()
        }
    }
}

#Preview {
    ContentView()
}
