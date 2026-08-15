//
//  ModelData.swift
//  YesNoApp
//
//  Created by Van Tai on 24/7/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class YesNoViewModel {
    private static let endpoint: URL = {
        guard let url = URL(string: "https://yesno.wtf/api") else {
            fatalError("The yes/no API endpoint is invalid.")
        }
        return url
    }()

    private(set) var answer: YesNo?
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    func fetchAnswer() async {
        guard !isLoading else { return }

        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            let (data, response) = try await URLSession.shared.data(from: Self.endpoint)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                throw YesNoServiceError.invalidResponse
            }

            answer = try JSONDecoder().decode(YesNo.self, from: data)
        } catch {
            guard !Self.isCancellation(error) else { return }
            errorMessage = Self.message(for: error)
        }
    }

    private static func isCancellation(_ error: Error) -> Bool {
        error is CancellationError || (error as? URLError)?.code == .cancelled
    }

    private static func message(for error: Error) -> String {
        if let serviceError = error as? YesNoServiceError {
            serviceError.localizedDescription
        } else if error is DecodingError {
            "The service returned an answer in an unexpected format. Please try again."
        } else {
            "Couldn’t reach the service. Check your connection and try again."
        }
    }
}
