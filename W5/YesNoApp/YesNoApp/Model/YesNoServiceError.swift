//
//  YesNoServiceError.swift
//  YesNoApp
//
//  Created by Codex on 24/7/26.
//

import Foundation

enum YesNoServiceError: LocalizedError {
    case invalidResponse

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            "The service returned an unexpected response. Please try again."
        }
    }
}
