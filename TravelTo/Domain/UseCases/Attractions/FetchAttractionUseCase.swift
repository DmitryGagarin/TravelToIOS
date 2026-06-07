//
//  FetchAttractionUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchAttractionUseCaseProtocol {
    func execute(name: String) async throws -> Attraction
}

final class FetchAttractionUseCase: FetchAttractionUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute(name: String) async throws -> Attraction {
        return try await repository.fetchAttraction(byName: name)
    }
}
