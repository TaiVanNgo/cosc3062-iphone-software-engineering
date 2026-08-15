//
//  GifImageView.swift
//  YesNoApp
//
//  Created by Van Tai on 24/7/26.
//

import SwiftUI
import WebKit

struct GifImageView: View {
    let url: URL

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var page = WebPage()
    @State private var loadFailed = false

    var body: some View {
        ZStack {
            Color.secondary.opacity(0.08)

            if reduceMotion {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        unavailableImage
                    @unknown default:
                        unavailableImage
                    }
                }
            } else if loadFailed {
                unavailableImage
            } else {
                WebView(page)
                    .webViewBackForwardNavigationGestures(.disabled)
                    .webViewMagnificationGestures(.disabled)
                    .webViewLinkPreviews(.disabled)
            }
        }
        .task(id: url) {
            await loadGIF()
        }
        .accessibilityHidden(true)
    }

    private var unavailableImage: some View {
        Label("Image unavailable", systemImage: "photo.badge.exclamationmark")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    private func loadGIF() async {
        guard !reduceMotion else { return }

        loadFailed = false

        do {
            for try await _ in page.load(url) {}
        } catch {
            guard !Task.isCancelled else { return }
            loadFailed = true
        }
    }
}
