//
//  CreatePosterUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol CreatePosterUseCaseProtocol {
    func execute(attractionName: String, request: CreatePosterRequest, images: [Data]) async throws -> [Poster]
}

final class CreatePosterUseCase: CreatePosterUseCaseProtocol {
    private let repository: PosterRepositoryProtocol
    
    init(repository: PosterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(attractionName: String, request: CreatePosterRequest, images: [Data]) async throws -> [Poster] {
        return try await repository.createPoster(attractionName: attractionName, request: request, images: images)
    }
}
