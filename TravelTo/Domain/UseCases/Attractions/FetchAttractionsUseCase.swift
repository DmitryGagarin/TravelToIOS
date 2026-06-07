//
//  FetchAttractionsUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchAttractionsUseCaseProtocol {
    func execute() async throws -> [Attraction]
}

final class FetchAttractionsUseCase: FetchAttractionsUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Attraction] {
        return try await repository.fetchAttractions()
    }
}
