//
//  FetchPostersUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchPostersUseCaseProtocol {
    func execute(attractionName: String) async throws -> [Poster]
}

final class FetchPostersUseCase: FetchPostersUseCaseProtocol {
    private let repository: PosterRepositoryProtocol
    
    init(repository: PosterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(attractionName: String) async throws -> [Poster] {
        return try await repository.fetchPosters(forAttractionName: attractionName)
    }
}
