//
//  CreateAttractionUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol CreateAttractionUseCaseProtocol {
    func execute(request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction
}

final class CreateAttractionUseCase: CreateAttractionUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute(request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction {
        return try await repository.createAttraction(request: request, images: images)
    }
}
