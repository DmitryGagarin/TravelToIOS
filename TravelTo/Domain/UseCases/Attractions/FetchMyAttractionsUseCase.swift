//
//  FetchMyAttractionsUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchMyAttractionUseCaseProtocol {
    func execute() async throws -> [Attraction]
}

final class FetchMyAttractionUseCase: FetchMyAttractionUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Attraction] {
        return try await repository.fetchMyAttractions()
    }
}
