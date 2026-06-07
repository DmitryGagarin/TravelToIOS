//
//  RepositoryError.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum RepositoryError: LocalizedError {
    case mappingFailed
    case networkError(Error)
    case notFound

    var errorDescription: String? {
        switch self {
        case .mappingFailed: return "Failed to map server response to domain model."
        case .networkError(let error): return error.localizedDescription
        case .notFound: return "Requested resource not found."
        }
    }
}
